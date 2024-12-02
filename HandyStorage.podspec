
Pod::Spec.new do |spec|

  spec.name = "HandyStorage"
  spec.version = "1.0.0"
  spec.summary = "HandyStorage is a wrapper over UserDefaults which act like a LightStorage and work with Codable classes...Trust me it's really handy 😊😊"
  spec.description  = <<-DESC
    If you wanna get rid of Huge Databases for your app, just install HandyStorage and enjoy the simplicity. -shndrs
                   DESC

  spec.homepage = "https://github.com/shndrs/HandyStorage"
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author = { "shndrs" => "sahandraeisi1994@gmail.com" }

  spec.ios.deployment_target = "9.3"
  spec.swift_version = "6"

  spec.source = { :git => "https://github.com/shndrs/HandyStorage.git", :tag => "#{spec.version}" }

  spec.source_files = "HandyStorage/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"

end
