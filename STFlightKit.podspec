Pod::Spec.new do |s|
  s.name             = 'STFlightKit'
  s.version          = '0.1.0'
  s.summary          = 'This is the flight module of sharetrip ios'
  
  s.description      = <<-DESC
  "TODO: Add long description of the pod here"
  DESC
  
  s.homepage         = 'https://github.com/abmomen/STFlightKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'abmomen' => 'abdulmomen130@gmail.com' }
  s.source           = { :git => 'https://github.com/abmomen/STFlightKit.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'STFlightKit/Classes/**/*.{swift}'
  
  s.resource_bundles = {
    'STFlightKit' => ['STFlightKit/Classes/**/*.{xib,storyboard,xcassets}']
  }
  
  s.resources = 'STFlightKit/Classes/**/*.{xib,storyboard,xcassets}'
  
end
