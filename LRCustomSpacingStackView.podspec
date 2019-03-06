#
#  Be sure to run `pod spec lint LRCustomSpacingStackView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LRCustomSpacingStackView"

  s.version      = "1.1.0"

  s.summary      = "An UIStackView extension to make custom spacing easier to use, and also work on iOS 9. Written in Swift 4.2"
  
  s.description  = <<-DESC

  UIStackView officially supports custom spacing on iOS 11. This library makes it easier to use, and also work on iOS 9 +.
  
  1. Custom spacing support on iOS 9 and above
  2. Spacing between arrangedSubviews
  3. Spacing between the arrangedSubview and the UIStackView
  4. Works with all UIStackView's existing functionalities. including inserting and removing arrangedSubviews, getting arrangedSubviews, setting arrangedSubviews' `isHidden` property.

  Requirements:
  1. iOS 9.0 +
  2. Swift 4.2
  3. uses Auto Layout

                   DESC
  
  s.homepage     = "https://github.com/lurui1029/LRCustomSpacingStackView"
  
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Lu Rui" => "340662964@qq.com" }

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/lurui1029/LRCustomSpacingStackView.git", :tag => "#{s.version}" }

  s.source_files = "*.swift"

  s.framework    = "UIKit"

  s.swift_version = "4.2"

end
