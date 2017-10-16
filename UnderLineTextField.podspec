Pod::Spec.new do |s|
s.name = "UnderLineTextField"
s.platform = :ios
s.ios.deployment_target	= "9.0"
s.requires_arc = true
s.module_name = "UnderLineTextField"
s.version = "1.0.0"
s.summary = "simple textfield with error and floating label"
s.description = ""
s.homepage = "http://mohammadalijf.com"
s.license = "MIT"
s.author = "Mohammad Ali Jafarian"
s.source = { :git => "",
:tag => "#{s.version}" }
s.source_files = "UnderLineTextField/*.swift"
end
