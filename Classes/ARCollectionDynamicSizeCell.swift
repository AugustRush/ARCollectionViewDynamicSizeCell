//
//  ARCollectionDynamicSizeCell.swift
//  ARDynamicSizeCollectionCell
//
//  Created by August on 15/7/15.
//  Copyright (c) 2015年 August. All rights reserved.
//

import UIKit

private var templeCells:[String:AnyObject] = Dictionary()

extension UICollectionView{
    
    func ar_dynamicSize(reuseIdentifier:String,indexPath:NSIndexPath,configuration:((AnyObject)->Void),fixedWidth:CGFloat = 0,fixedHeight:CGFloat = 0) -> CGSize {
        let cell = templeCell(reuseIdentifier) as! UICollectionViewCell
        configuration(cell)
        if fixedWidth > 0 && fixedHeight > 0{
            return CGSizeMake(fixedWidth, fixedHeight)
        }
        var fixedValue : CGFloat = 0
        var attribute : NSLayoutAttribute = NSLayoutAttribute.NotAnAttribute
        if fixedWidth > 0 {
            fixedValue = fixedWidth
            attribute = NSLayoutAttribute.Width
        }else if fixedHeight > 0{
            fixedValue = fixedHeight
            attribute = NSLayoutAttribute.Height
        }
        
        let fixedLayout = NSLayoutConstraint(item: cell.contentView, attribute: attribute, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: attribute, multiplier: 1, constant: fixedValue)
        cell.contentView.addConstraint(fixedLayout)
        var size = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        cell.contentView.removeConstraint(fixedLayout)
        return size
    }
    
    
    func templeCell(reuseIdentifier:String) -> AnyObject {
        var cell: AnyObject? = templeCells[reuseIdentifier]
        if cell == nil{
            let cellNibDict = self.valueForKey("_cellNibDict") as! [String:AnyObject]
            let cellNib = cellNibDict[reuseIdentifier] as! UINib
            cell = cellNib.instantiateWithOwner(nil, options: nil).last
            templeCells[reuseIdentifier] = cell
        }
        return cell!
    }
}
