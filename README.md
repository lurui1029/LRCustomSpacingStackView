# LRCustomSpacingStackView

[![Pod Version](http://img.shields.io/cocoapods/v/LRCustomSpacingStackView.svg?style=flat)](http://cocoadocs.org/docsets/LRCustomSpacingStackView/)
[![Pod Platform](http://img.shields.io/cocoapods/p/LRCustomSpacingStackView.svg?style=flat)](http://cocoadocs.org/docsets/LRCustomSpacingStackView/)
[![Pod License](http://img.shields.io/cocoapods/l/LRCustomSpacingStackView.svg?style=flat)](https://mit-license.org)

UIStackView officially supports custom spacing after iOS 11. This library makes it easier to use, and work on iOS 9.

## Features
- [x] Custom spacing support on iOS 9 and above
- [X] Spacing after and/or before the arrangedView
- [X] Spacing between the arrangedView and the UIStackView
- [X] Works with all UIStackView's existing functionalities

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
1. Set up your stack view and subviews using Auto Layout, just like you did before
2. Use extension methods provided by this library's, instead of `UIStackView`'s builtin methods
3. custom view's spacing by setting its `lr_stackSpacing`

|  new | old |
| -------------------------------- | ----------------------------- |
| lr_arrangedSubviews              | arrangedSubviews              |
| lr_addArrangedSubview(\_:)       | addArrangedSubview(\_:)       |
| lr_removeArrangedSubview(\_:)    | removeArrangedSubview(\_:)    |
| lr_insertArrangedSubview(\_:at:) | insertArrangedSubview(\_:at:) |

[See Wiki for a detailed documentation](https://github.com/lurui1029/LRCustomSpacingStackView/wiki)

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

A good practice is to, always set up your stack view and subviews using regular APIs, make sure it works, after that, replace builtin methods with this library's and use `lr_stackSpacing` for custom spacing.

PRs and Issues are welcome.
