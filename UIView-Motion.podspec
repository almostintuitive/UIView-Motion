Pod::Spec.new do |s|

  s.name         = "UIView-Motion"
  s.version      = "1.0.1"
  s.summary      = "addSubview and removeFromSuperview with animations! (not with autolayout though)"

  s.description  = <<-DESC
                   UIView helper category to add animation on addSubview & removeFromSuperView with one method. Uses facebook pop. Doesn't play well with AutoLayout.
                   DESC

  s.homepage     = "https://github.com/itchingpixels/UIView-Motion"

  s.license      = { :type => "MIT", :file => "LICENCE" }

  s.author             = { "Mark Szulyovszky" => "mark.szulyovszky@gmail.com" }
  s.social_media_url   = "http://twitter.com/itchingpixels"

  s.source       = { :git => "https://github.com/itchingpixels/UIView-Motion.git", :tag => s.version }
  s.source_files = 'Class/*'
  s.exclude_files = "Example/*"
  s.dependency 'pop', '~> 1.0'
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.7'
end
