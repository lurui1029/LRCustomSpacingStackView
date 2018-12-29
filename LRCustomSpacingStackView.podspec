#
#  Be sure to run `pod spec lint LRCustomSpacingStackView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LRCustomSpacingStackView"

  s.version      = "1.0.0"

  s.summary      = "An UIStackView extension to support custom (left, right, top, bottom) spacing for arrangedSubviews."
  
  s.description  = <<-DESC

  UIStackView supports custom spacing along its axis after iOS 11.0.
  
  This library:
  1. provides custom spacing support for iOS 9.0 +
  2. provides a more flexible and powerful way to add custom spacing by giving UIView a UIEdgeInsets
  3. works well with all UIStackView's functionalities

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

end
