[![Build Status](https://travis-ci.org/mohammadalijf/UnderLineTextField.svg?branch=master)](https://travis-ci.org/mohammadalijf/UnderLineTextField)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/cocoapods/v/UnderLineTextField.svg)](https://cocoapods.org/pods/UnderLineTextField)


# UnderLineTextField
Simple UITextfield Subclass with state

![demo](https://github.com/mohammadalijf/UnderLineTextField/raw/master/src/demo.gif "Example App")

* [Installation](#installation)
* [How It Works](#how-it-works)

## Installation

### Cocoapods
You can use [cocoapods](https://cocoapods.org)  to add UnderLineTextField to your project

```ruby
target 'MyApp' do
  pod 'UnderLineTextField', '~> 2.0'
end
```
### Carthage
You can use [Carthage](https://github.com/Carthage/Carthage) to add UnderLineTextField to your project

To integrate UnderLineTextField into your Xcode project using Carthage, specify it in your 'Cartfile':

```ogdl
github "mohammadalijf/UnderLineTextField"
```

Run `carthage update` to build the framework and drag the built `UnderLineTextField.framework` into your Xcode project.

> xcode does not support 'IBDesignable' or 'IBInspecatable' on cocoa frameworks. to work around for carthage users. created simple 'UnderLineTextFieldCarthage.swift' file. it is a wrapper around 'UnderLineTextfield' which can be used in projects for supporting 'IBDesignable' and 'IBInspecatable'. just simply drop 'UnderLineTextFieldCarthage.swift' in your project and use this class instead of 'UnderLineTextfield'. 

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
