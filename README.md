# ARCollectionViewDynamicSizeCell(swift)
An simple extension for caculating autolayout UICollectionViewCell size. Use for swift.
Objective-c version: 'https://github.com/AugustRush/UICollectionView-ARDynamicHeightLayoutCell';

## Support
* prototype cell in storyboard

* -registerNib:forCellReuseIdentifier:

* -registerClass:forCellReuseIdentifier:

## Usage

#### Dynamic Size
```   
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.ar_dynamicSize("FeedCell", indexPath: indexPath, configuration: { (cell:AnyObject) -> Void in
            //let feedCell = cell as! FeedCell
            //configuration of your cell
        })
    }

```

#### Fixed Width
```   
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.ar_dynamicSize("FeedCell", indexPath: indexPath, configuration: { (cell:AnyObject) -> Void in
            //let feedCell = cell as! FeedCell
            //configuration of your cell
        },fixedWidth:320)//sample width
    }
```

#### Fixed Height
```   
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.ar_dynamicSize("FeedCell", indexPath: indexPath, configuration: { (cell:AnyObject) -> Void in
            //let feedCell = cell as! FeedCell
            //configuration of your cell
        },fixedHeight:200)//sample height
    }

```

## License

The MIT License (MIT)

Copyright (c) 2015 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.