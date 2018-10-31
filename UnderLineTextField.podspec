Pod::Spec.new do |s|
s.name = "UnderLineTextField"
s.platform = :ios
s.ios.deployment_target	= "9.0"
s.requires_arc = true
s.module_name = "UnderLineTextField"
s.version = "2.1.0"
s.summary = "Simple UITextfield Subclass with state"
s.description = "simple UITextField subclass with state and floating placeholder"
s.homepage = "https://github.com/mohammadalijf/UnderLineTextField"
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.author = "Mohammad Ali Jafarian"
s.source = { :git => 'https://github.com/mohammadalijf/UnderLineTextField.git',
:tag => "#{s.version}" }
s.source_files = 'Source/UnderLineTextField/**/*.{swift,h}'
s.resource = 'Source/UnderLineTextField/Supporting Files/Extera.xcassets'
end
