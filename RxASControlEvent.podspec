#
# Be sure to run `pod lib lint RxASControlEvent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxASControlEvent'
  s.version          = '0.1.0'
  s.summary          = 'Texture(Async Display Kit) ControlEvent Reactive wrapper.'

  s.description      = "Texture(Async Display Kit) ControlEvent Reactive Wrapper"
  s.homepage         = 'https://github.com/Geektree0101/RxASControlEvent'
  s.license          = { :type => 'APACHE', :file => 'LICENSE' }
  s.author           = { 'Geektree0101' => 'h2s1880@gmail.com' }
  s.source           = { :git => 'https://github.com/Geektree0101/RxASControlEvent.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.3'

  s.source_files = 'RxASControlEvent/Classes/**/*'

  s.dependency 'RxSwift', '~> 4.0'
  s.dependency 'RxCocoa', '~> 4.0'
  s.dependency 'Texture'
end
