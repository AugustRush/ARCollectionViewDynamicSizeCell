//The MIT License (MIT)
//
//Copyright (c) 2015
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import UIKit

extension UICollectionView{
    private struct associateKey{
        static var templeCellsKey = "templeCells"
    }
    
    private var templeCells : [String:AnyObject] {
        get{
            var dict = objc_getAssociatedObject(self, &associateKey.templeCellsKey) as? [String:AnyObject]
            if dict == nil {
                dict = Dictionary()
                objc_setAssociatedObject(self, &associateKey.templeCellsKey, dict!, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
            }
            return dict!
        }
        
        set{
            objc_setAssociatedObject(self, &associateKey.templeCellsKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
    }
    
    func ar_dynamicSize(reuseIdentifier:String,indexPath:NSIndexPath,configuration:((AnyObject)->Void),fixedWidth:CGFloat = 0,fixedHeight:CGFloat = 0) -> CGSize {
        let cell = templeCell(reuseIdentifier) as! UICollectionViewCell
        cell.prepareForReuse()
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
    
    
     private func templeCell(reuseIdentifier:String) -> AnyObject {
        var cell: AnyObject? = templeCells[reuseIdentifier]
        if cell == nil{
            let cellNibDict = self.valueForKey("_cellNibDict") as! [String:AnyObject]
            let cellNib = cellNibDict[reuseIdentifier] as! UINib
            cell = cellNib.instantiateWithOwner(nil, options: nil).last
            templeCells[reuseIdentifier] = cell
        }
        return cell!
    }
    
    private func templeCellsDict() -> [String:AnyObject]{
        let selector = "templeCellsDict"
        var dict = objc_getAssociatedObject(self, selector) as? [String:AnyObject]
        if dict == nil {
            dict = Dictionary()
            objc_setAssociatedObject(self, selector, dict, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
        }
        return dict!
    }
}
