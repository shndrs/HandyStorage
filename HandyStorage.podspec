
Pod::Spec.new do |spec|

  spec.name = "HandyStorage"
  spec.version = "2.0.1"
  spec.summary = "If you wanna get rid of Huge Databases for your app, just install HandyStorage and enjoy the simplicity."
  spec.description  = <<-DESC
    HandyStorage is a wrapper over UserDefaults which act like a LightStorage and work with Codable classes...Trust me it's really handy 😊😊 -shndrs
                   DESC
  spec.homepage = "https://github.com/shndrs/HandyStorage"
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author = { "shndrs" => "sahandraeisi1994@gmail.com" }
  spec.ios.deployment_target = "9.3"
  spec.osx.deployment_target = '10.13'
  spec.swift_version = "6"
  spec.source = { :git => "https://github.com/shndrs/HandyStorage.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/**/*.swift"
  spec.exclude_files = "Classes/Exclude"

end
