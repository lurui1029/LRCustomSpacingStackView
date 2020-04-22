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

  s.summary      = "An UIStackView extension to make custom spacing easier to use, and also work on iOS 9."
  
  s.description  = <<-DESC
    An UIStackView extension to make custom spacing easier to use, and also work on iOS 9.
                   DESC
  
  s.homepage     = "https://github.com/lurui1029/LRCustomSpacingStackView"
  
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Lu Rui" => "lurui006@icloud.com" }

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/lurui1029/LRCustomSpacingStackView.git", :tag => "#{s.version}" }

  s.source_files = "*.swift"

  s.framework    = "UIKit"

  s.swift_version = "5"

end
