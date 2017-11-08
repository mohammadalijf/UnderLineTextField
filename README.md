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
  pod 'UnderLineTextField', '~> 2.0'
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

textfield have diffrent kind of UnderLineTextFieldValidateType. each time tells textfield when call validate().

* onFly

    as soon as textfield value changes
* afterEdit

    as soon as textfield didEndEditing
* onCommit

    manualy gets validate by user
* always

    alway validate textfield. when become beginEditing, when value changes, when didEndEditing

> by default value is .afterEdit

you can change validation type by setting validationType
```swift
 underLineTextField.validationType = .always
```

you can ask textfield to validate user input by calling 

```swift
underLineTextField.validate()
```
### UnderLineTextFieldDelegate

Also you have **UnderLineTextFieldDelegate** to help you with your textfield. when a class confirm to **UnderLineTextFieldDelegate** protocol, it also confirms to **UITextFieldDelegate**. so you have both delegate methods on hand.


* textFieldValidate

this func is called whenever you ask the textfield to **validate()** user input. you usually want to set warning or error state in here.

```swift
func textFieldValidate(underLineTextField: UnderLineTextField) throws
```

you can either throw warrning or errors

```swift
func textFieldValidate(underLineTextField: UnderLineTextField) throws {
    throw UnderLineTextFieldErrors
                    .error(message: "error message")
    // or
    throw UnderLineTextFieldErrors
                    .warning(message: "warning message")
}
```

* textFieldTextChanged
this func is called when text changes. or clear button is used.

```swift
func textFieldTextChanged(underLineTextField: UnderLineTextField)
```
