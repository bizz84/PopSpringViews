Pod::Spec.new do |s|
  s.name         = 'PopSpringViews'
  s.version      = '0.1.0'
  s.summary      = 'Helper classes to enable Facebook POP spring animations on UIViews'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/bizz84/PopSpringViews'
  s.author       = { 'Andrea Bizzotto' => 'bizz84@gmail.com' }
  s.ios.deployment_target = '8.0'

  s.source       = { :git => "https://github.com/bizz84/PopSpringViews.git", :tag => s.version }

  s.source_files = 'PopSpringViews/*.{h,swift}'
  s.module_name  = 'PopSpringViews'

  s.screenshots  = []

  s.requires_arc = true

  s.dependency 'pop'
  s.xcconfig = {
    'HEADER_SEARCH_PATHS' => 'Pods/Headers/Public/pop'
  }
end
