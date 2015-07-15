//
//  ViewController.swift
//  ARDynamicSizeCollectionCell
//
//  Created by August on 15/7/15.
//  Copyright (c) 2015年 August. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    var feeds : [FeedModel] = Array()

    override func viewDidLoad() {
        super.viewDidLoad()

        let names = ["Swift", "Tommy emannual","somebody"]
        
        let contents = ["Swift提供了類似 C 語言的流程控制結構，包括可以多次執行任務的for和while迴圈，基於特定條件選擇執行不同程式碼分支的if和switch語句，還有控制流程程跳轉到其他程式碼的break和continue語句。",
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum",
        "I'm August rush , he's a boy in a Moivie"];
        for index in 1...50 {
            let image = UIImage(named: String(arc4random()%4)+".jpg")!
            let feed = FeedModel(name: names[index%3],image: image, text: contents[index%3])
            feeds.append(feed)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK:UICollectionViewDelegateFlowLayout methods
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.ar_dynamicSize("FeedCell", indexPath: indexPath, configuration: { (cell:AnyObject) -> Void in
            let feedCell = cell as! FeedCell
            feedCell.nameLabel.text = self.feeds[indexPath.row].name
            feedCell.imageView.image = self.feeds[indexPath.row].image
            feedCell.textLabel.text = self.feeds[indexPath.row].text
        },fixedWidth:CGRectGetWidth(self.collectionView.bounds))
    }
    
    //MARK: UICollectionViewDataSource methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeedCell", forIndexPath: indexPath) as! FeedCell
        cell.nameLabel.text = self.feeds[indexPath.row].name
        cell.imageView.image = self.feeds[indexPath.row].image
        cell.textLabel.text = self.feeds[indexPath.row].text
        return cell
    }
}

/**
*  feed struct
*/

struct FeedModel {
    var name : String
    var image : UIImage
    var text : String
}
