# ATActionSheet

[![Twitter](https://img.shields.io/badge/Twitter-@Ramotion-blue.svg?style=flat)](https://twitter.com/atahhan_)
[![CocoaPods](https://img.shields.io/cocoapods/p/CircleMenu.svg)](https://cocoapods.org/pods/ATActionSheet)
[![CocoaPods](https://img.shields.io/cocoapods/v/CircleMenu.svg)](http://cocoapods.org/pods/ATActionSheet)

## Requirements

- iOS 9.0+
- Xcode 9.0.1

## Installation

Just add CircleMenuLib folder to your project.

or use [CocoaPods](https://cocoapods.org) with Podfile:

```ruby
pod 'ATActionSheet'
```
github "ATahhan/ATActionSheet"
```

## Usage

##### programmatically

```swift
        let actionSheet = ATActionSheet()
        
        let addButton = ATAction(title: "Add New Item", image: #imageLiteral(resourceName: "add")) {
            print("Added")
        }
        let shareButton = ATAction(title: "Share", image: #imageLiteral(resourceName: "action")) {
            print("Share")
        }
        let deleteButton = ATAction(title: "Delete", image: #imageLiteral(resourceName: "trash")) {
            print("Deleted")
        }
        
        actionSheet.addActions([addButton, shareButton, deleteButton])
        present(actionSheet, animated: true, completion: nil)
```

## Licence

ATActionSheet is released under the MIT license.
See [LICENSE](./LICENSE) for details.
<br>

<a href="https://itunes.apple.com/app/apple-store/id1182360240?pt=550053&ct=circle-menu&mt=8" >
<img src="https://github.com/ramotion/gliding-collection/raw/master/app_store@2x.png" width="117" height="34"></a>
<a href="https://dev.ramotion.com?utm_source=gthb&utm_medium=repo&utm_campaign=circle-menu">
<img src="https://github.com/ramotion/gliding-collection/raw/master/contact_our_team@2x.png" width="187" height="34"></a>
<br>
<br>

Follow me on Twitter<br>
<a href="http://twitter.com/atahhan_" >
<img src="https://cdn1.iconfinder.com/data/icons/iconza-circle-social/64/697029-twitter-128.png" width="120" height="120"></a>
