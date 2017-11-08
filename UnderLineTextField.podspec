Pod::Spec.new do |s|
s.name = "UnderLineTextField"
s.platform = :ios
s.ios.deployment_target	= "9.0"
s.requires_arc = true
s.module_name = "UnderLineTextField"
<<<<<<< HEAD
s.version = "2.0.0"
=======
s.version = "1.1.1"
>>>>>>> ea8e53086a5e29b0b0e2718fe022cadb4da5fb33
s.summary = "Simple UITextfield Subclass with state"
s.description = "simple UITextField subclass with state and floating placeholder"
s.homepage = "https://github.com/mohammadalijf/UnderLineTextField"
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.author = "Mohammad Ali Jafarian"
s.source = { :git => 'https://github.com/mohammadalijf/UnderLineTextField.git',
:tag => "#{s.version}" }
s.source_files = 'Source/UnderLineTextField/*.swift'
s.resource = 'Source/UnderLineTextField/Supporting Files/Extera.xcassets'
end
