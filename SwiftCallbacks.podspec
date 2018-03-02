Pod::Spec.new do |s|
  s.name         = "SwiftCallbacks"
  s.version      = "4.0.0"
  s.summary      = "Replace Target-Action Pattern With Callbacks"
  s.description  = <<-DESC
                    SwiftCallbacks replaces the Target-Action pattern with callbacks for UIControl and UIBarButtonItem.
                   DESC
  s.homepage     = "https://github.com/bradhilton/SwiftCallbacks"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Brad Hilton" => "brad@skyvive.com" }
  s.source       = { :git => "https://github.com/bradhilton/SwiftCallbacks.git", :tag => "4.0.0" }

  s.ios.deployment_target = "8.0"

  s.source_files  = "SwiftCallbacks", "SwiftCallbacks/**/*.{swift,h,m}"
  s.requires_arc = true
  s.dependency 'AssociatedValues', '~>3.0.0'
end
