# UnderLineTextField
Simple UITextfield Subclass with state

![demo](https://github.com/mohammadalijf/UnderLineTextField/raw/master/src/demo.gif "Example App")

* [Installation](#installation)
* [How It Works](#how-it-works)

## Installation

### Cocoapods
You can use [cocoapods](https://cocoapods.org)  to add UnderLineTextField to your project

```
target 'MyApp' do
  pod 'UnderLineTextField', '~> 1.1'
end
```

## How It Works

### UnderLineTextField

each textfield have four state

* inactive

    when textfield have no errors or warnings and is resigned from first responder

* active

    when textfield become first responder

* warning

    when you want show warnings to user

* error

    when you want show error to user



> by default textfield have .inactive state

You can easily change textfield state by setting **status**   

```swift
    /// become inactive 
    underLineTextField.status = .inactive
    /// become active state
    underLineTextField.status = .active
    /// warning state
    underLineTextField.status = .warning(message: "warning message")
    /// error state
    underLineTextField.status = .error(message: "error message")
```

you can ask textfield to validate user input by calling 

```swift
    underLineTextField.validate()
```
### UnderLineTextFieldDelegate

Also you have **UnderLineTextFieldDelegate** to help you with your textfield. when a class confirm to **UnderLineTextFieldDelegate** protocol, it also confirms to **UITextFieldDelegate**. so you have both delegate methods on hand.


* textFieldValidate

this func is called whenever textfield become inactive or you ask the textfield to **validate()** user input. you usually want to set warning or error state in here.

```swift
func textFieldValidate(underLineTextField: UnderLineTextField) throws
```

* textFieldTextChanged
this func is called when text changes. or clear button is used.

```swift
    func textFieldTextChanged(underLineTextField: UnderLineTextField)
```
