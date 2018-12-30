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
This library is designed to support custom spacing for UIStackView without breaking any builtin behaviors.

A good practice is to, always set up your stack view and subviews using regular APIs, make sure it works, after that, replace builtin methods with this library's

PRs and Issues are welcome.
