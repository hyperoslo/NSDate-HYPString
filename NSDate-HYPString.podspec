Pod::Spec.new do |s|
  s.name             = "NSDate-HYPString"
  s.summary          = "Categories to convert NSDates to NSStrings"
  s.version          = "0.1.1"
  s.homepage         = "https://github.com/hyperoslo/NSDate-HYPString"
  s.license          = 'MIT'
  s.author           = { "Hyper AS" => "teknologi@hyper.no" }
  s.source           = { :git => "https://github.com/hyperoslo/NSDate-HYPString.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hyperoslo'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Source/**/*'
  s.frameworks = 'Foundation'
end
