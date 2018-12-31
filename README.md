# ATActionSheet

<a href="https://developer.apple.com/swift/"><img src="https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat" style="max-height: 300px;" alt="Swift"/></a>
<a href="https://cocoapods.org/pods/ATActionSheet"><img src="https://img.shields.io/cocoapods/v/ATActionSheet.svg" style="max-height: 300px;" alt="PodVersion"/></a>
<img src="https://img.shields.io/badge/platform-iOS-lightgrey.svg" style="max-height: 300px;" alt="Platform: iOS">

<img src="https://github.com/ATahhan/ATActionSheet/blob/master/Screenshots/ATActionSheet.gif" width="333" height="600" /><br><br/>

## Requirements

- iOS 9.0+
- Xcode 9.3

## Installation

Just add this project as a submodule to your project.

or use [CocoaPods](https://cocoapods.org) with Podfile:

```ruby
pod 'ATActionSheet'
```

## Usage

##### Programmatically

```swift
let actionSheet = ATActionSheet()
        
let addButton = ATAction(title: "Add New Item", image: #imageLiteral(resourceName: "add")) {
    print("Added")
}
let shareButton = ATAction(title: "Share", image: #imageLiteral(resourceName: "action"), style: .default) {
    print("Share")
}
let deleteButton = ATAction(title: "Delete", image: #imageLiteral(resourceName: "trash"), style: .destructive) {
    print("Deleted")
}
        
actionSheet.addActions([addButton, shareButton, deleteButton])
present(actionSheet, animated: true, completion: nil)
```

## Licence

ATActionSheet is released under the MIT license.
See [LICENSE](./LICENSE) for details.
<br>

Contact me on Twitter<br>
<a href="http://twitter.com/atahhan_" >
<img src="https://cdn1.iconfinder.com/data/icons/iconza-circle-social/64/697029-twitter-128.png" width="120" height="120"></a>
