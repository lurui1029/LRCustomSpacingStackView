# LRCustomSpacingStackView

[![Pod Version](http://img.shields.io/cocoapods/v/LRCustomSpacingStackView.svg?style=flat)](http://cocoadocs.org/docsets/LRCustomSpacingStackView/)
[![Pod Platform](http://img.shields.io/cocoapods/p/LRCustomSpacingStackView.svg?style=flat)](http://cocoadocs.org/docsets/LRCustomSpacingStackView/)
[![Pod License](http://img.shields.io/cocoapods/l/LRCustomSpacingStackView.svg?style=flat)](https://mit-license.org)

UIStackView officially supports custom spacing after iOS 11. This library makes it easier to use, and also work on iOS 9.

## Features
- [x] Custom spacing support on iOS 9 and above
- [X] Spacing after and/or before the arrangedView
- [X] Spacing between the arrangedView and the UIStackView
- [X] Works with all UIStackView's existing functionalities. including inserting and removing arrangedSubviews, getting arrangedSubviews, even animating spacing changes. Everything just works.

## Requirements
- iOS 9.0 and above
- Swift 4.2
- Auto Layout

## How to use
```swift
import LRCustomSpacingStackView

stackView.lr_addArrangedSubview(view1)
view1.lr_stackSpacing = UIEdgeInsets(top: 20, left: 30, bottom: 10, right: 0)
```
1. Set up your stack view and subviews using Auto Layout. For more, [see Auto Layout with UIStackView](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html#//apple_ref/doc/uid/TP40010853-CH11-SW1) 
2. Use extension methods provided by this library, instead of `UIStackView`'s builtin methods, to add `UIView`s to `UIStackView`
3. custom `UIView`'s spacing by setting its `lr_stackSpacing` property, instead of `setCustomSpacing(_:after:)` 

Simply speaking, use APIs on the left each time you want to use APIs on the right, and everything else would be covered for you.

|  This library's extensions       | UIStackView                               |
| -------------------------------- | -----------------------------             |
| init(lr_arrangedSubviews:)       | UIStackView.init(arrangedSubviews:)       |
| lr_arrangedSubviews              | UIStackView.arrangedSubviews              |
| lr_addArrangedSubview(\_:)       | UIStackView.addArrangedSubview(\_:)       |
| lr_removeArrangedSubview(\_:)    | UIStackView.removeArrangedSubview(\_:)    |
| lr_insertArrangedSubview(\_:at:) | UIStackView.insertArrangedSubview(\_:at:) |
| UIView.lr_stackSpacing           | UIStackView.setCustomSpacing(\_:after:)   |

[See Wiki for a detailed documentation (Not completed yet)](https://github.com/lurui1029/LRCustomSpacingStackView/wiki)

## Installation with CocoaPods
[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C and Swift, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

#### Podfile
```
platform: ios, '9.0'

pod 'LRCustomSpacingStackView', '~> 1.0.0'
```

## Manual Installation
Simply download `UIStackView+LRCustomSpacing.swift`, drag it to your project.

## Note
This library is designed to support custom spacing for UIStackView without breaking any builtin behaviors, but custom spacing you specified in `UIView`'s `lr_stackSpacing` property has the highest priority in the final layout. That is:

1. You can set `UIStackView.spacing` to add a fixed spacing for all subviews, and then set some subviews' `lr_stackSpacing` for extra spacings.
    
2. You can still use `setCustomSpacing(_:after:)`, although you don't have to in almost all cases.
    
3. It is still your responsibility to make sure your stack view is free of conflicts. Nothing is different from setting up a regular UIStackView using Auto Layout, **except that a subview's size in the eye of the stack view is actually the sum of the subview's size  and its `lr_stackSpacing` insets.** This may cause conflicts sometimes. For example, if your stack view's axis is vertical and width is 300, a subview's width is also 300, in this case, this subview's width + `lr_stackSpacing.left` + `lr_stackSpacing.right` must <= 300. Otherwise, the stack view considers this subview's width is larger than its own width, which is a conflict for a vertical stack view. To prevent this, set up your subview's size with a low priority (so that the stack view can resize subviews based on its axis, spacing, distribution and alignment), or make the stack view self-growing at its axis.

A good practice is to, always set up your stack view and subviews using regular `UIStackView` APIs, make sure it is free of conflicts, after that, replace builtin methods with this library's

PRs and Issues are welcome.
