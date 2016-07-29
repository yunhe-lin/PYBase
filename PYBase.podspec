#
# Be sure to run `pod lib lint PYBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PYBase'
  s.version          = '0.1.1'
  s.summary          = '基础控件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
base 系列
                       DESC

  s.homepage         = 'https://github.com/yunhe-lin/PYBase'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yunhe.lin' => '1367159949@qq.com' }
  s.source           = { :git => 'https://github.com/yunhe-lin/PYBase.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PYBase/Classes/**/*'
  
   s.resource_bundles = {
    'PYBase' => ['PYBase/Assets/*.{png, jpg}']
  }
    s.prefix_header_contents = '#import "PYBaseHeader.h"'
    s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'MJRefresh', '~> 3.1.12'
    s.dependency 'PYUtil', '~> 1.0.2'
end
