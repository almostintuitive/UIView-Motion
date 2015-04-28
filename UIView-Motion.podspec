Pod::Spec.new do |s|

  s.name         = "UIView-Motion"
  s.version      = "1.0.0"
  s.summary      = "addSubview and removeFromSuperview with animations! (not with autolayout though)"

  s.description  = <<-DESC
                   A small category on UIView that enables you to add a 

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/itchingpixels/UIView-Motion"

  s.license      = { :type => "MIT", :file => "LICENCE" }

  s.author             = { "Mark Szulyovszky" => "mark.szulyovszky@gmail.com" }
  s.social_media_url   = "http://twitter.com/itchingpixels"

  s.source       = { :git => "https://github.com/itchingpixels/UIView-Motion.git", :tag => s.version }
  s.source_files = 'UIView+Motion.h,m'
  s.exclude_files = "Example/*"
  s.dependency 'pop', '~> 1.0'
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.7'
end
