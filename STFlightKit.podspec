
Pod::Spec.new do |s|
  s.name             = 'STFlightKit'
  s.version          = '1.0.0'
  s.summary          = 'This pod holds the codebase of ShareTrip Flight.'

  s.description      = <<-DESC
  'White descriptive description'
                       DESC

  s.homepage         = 'https://github.com/abmomen/STFlightKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'abmomen' => 'abdulmomen130@gmail.com' }
  s.source           = { :git => 'https://github.com/abmomen/STFlightKit.git', :tag => s.version.to_s }
  
  s.swift_version = '5.0'
  s.ios.deployment_target = '13.0'
  
  s.source_files = 'Sources/**/*'
  s.ios.resource_bundle = { 'STFlightKit' => 'Assets/**/*.xcassets' }
  
  s.frameworks = 'UIKit', 'MapKit', 'Foundation'
  s.static_framework = true
  
  s.dependency 'STCoreKit', '1.0.0'
  
end
