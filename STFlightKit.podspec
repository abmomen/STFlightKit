Pod::Spec.new do |s|
  s.name             = 'STFlightKit'
  s.version          = '1.0.0'
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
  s.source_files = 'Pod/Classes/**/*.{swift}'
  
  s.resource_bundles = {
    'STFlightKit' => ['Pod/Classes/**/*.{storyboard,xib,xcassets,json,imageset,png}']
  }
  
  #s.resources = ['STFlightKit/**/*.{swift,xcassets,xib,storyboard}']
  
  s.dependency 'STCoreKit'
  s.dependency 'JWT'
  s.dependency 'PKHUD'
  s.dependency 'Base64'
  s.dependency 'Koloda'
  s.dependency 'BlueECC'
  s.dependency 'BlueRSA'
  s.dependency 'Alamofire'
  s.dependency 'lottie-ios'
  s.dependency 'SwiftyJSON'
  s.dependency 'Kingfisher'
  s.dependency 'Bolts-Swift'
  s.dependency 'BlueCryptor'
  s.dependency 'FloatingPanel'
  s.dependency 'GoogleSignIn'
  s.dependency 'ImageSlideshow'
  s.dependency 'JTAppleCalendar'
  s.dependency 'SwiftKeychainWrapper'
  s.dependency 'Socket.IO-Client-Swift'
  s.dependency 'FBSDKCoreKit'
  s.dependency 'FBSDKLoginKit'
  s.dependency 'FBSDKShareKit'
  s.dependency 'FirebaseAuth'
  s.dependency 'FirebaseFirestore'
  s.dependency 'FirebaseAnalytics'
  s.dependency 'FirebaseMessaging'
  s.dependency 'FirebaseCrashlytics'
  s.dependency 'FirebaseRemoteConfig'
  s.dependency 'FirebaseDynamicLinks'
  s.dependency 'IQKeyboardManagerSwift'
  s.dependency 'FirebaseCoreDiagnostics'
  
  
end
