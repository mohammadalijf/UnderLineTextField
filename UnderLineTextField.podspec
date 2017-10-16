Pod::Spec.new do |s|
s.name = "UnderLineTextField"
s.platform = :ios
s.ios.deployment_target	= "9.0"
s.requires_arc = true
s.module_name = "UnderLineTextField"
s.version = "1.0.1"
s.summary = "simple UITextField subclass with error and floating placeholder"
s.description = "simple UITextField subclass with error and floating placeholder"
s.homepage = "https://github.com/mohammadalijf/UnderLineTextField"
s.license = "MIT"
s.author = "Mohammad Ali Jafarian"
s.source = { :git => 'https://github.com/mohammadalijf/UnderLineTextField.git',
:tag => "#{s.version}" }
s.source_files = 'UnderLineTextField/*.swift'
end
