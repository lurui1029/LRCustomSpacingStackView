#
#  Be sure to run `pod spec lint LRCustomSpacingStackView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LRCustomSpacingStackView"

  s.version      = "0.0.1"

  s.summary      = "An UIStackView extension to support custom (left, right, top, bottom) spacing for arrangedSubviews."
  
  s.description  = <<-DESC
  An UIStackView extension to support custom (left, right, top, bottom) spacing for arrangedSubviews.
                   DESC
  
  s.homepage     = "https://github.com/lurui1029/LRCustomSpacingStackView"
  
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "Lu Rui" => "340662964@qq.com" }

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/lurui1029/LRCustomSpacingStackView.git", :tag => "#{s.version}" }

  s.source_files  = "*.swift"

  s.framework  = "UIKit"

end
