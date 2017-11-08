//
//  UnderLineTextFieldDelegate.swift
//  UnderLineTextField
//
//  Created by Mohammad Ali Jafarian on 16/10/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//
import UIKit

public protocol UnderLineTextFieldDelegate: UITextFieldDelegate {
    /// validate textfield and set status
    func textFieldValidate(underLineTextField: UnderLineTextField) throws
    /// called when textfield value changed
    func textFieldTextChanged(underLineTextField: UnderLineTextField)
}

public extension UnderLineTextFieldDelegate {
    func textFieldValidate(underLineTextField: UnderLineTextField) throws { }
    func textFieldTextChanged(underLineTextField: UnderLineTextField) { }
}
