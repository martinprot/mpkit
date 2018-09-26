#
# Be sure to run `pod lib lint mpkit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'mpkit'
  s.version          = '0.1.0'
  s.summary          = 'Random tools for simplifing life'
  s.swift_version 	 = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Random tools for simplifing life
                       DESC

  s.homepage         = 'https://github.com/Martin Prot/mpkit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Martin Prot' => 'martinprot@gmail.com' }
  s.source           = { :git => 'https://github.com/Martin Prot/mpkit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'mpkit/Classes/**/*'
  s.resources = 'mpkit/Assets/nib/*'
  
  # s.resource_bundles = {
  #   'mpkit' => ['mpkit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
