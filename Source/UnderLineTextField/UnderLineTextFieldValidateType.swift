//
//  UnderLineTextFieldValidateType.swift
//  UnderLineTextField
//
//  Created by Mohammad Ali Jafarian on 10/19/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import Foundation

/// when call validation
public struct UnderLineTextFieldValidateType: OptionSet {
    public let rawValue: UInt
    /// after text did change
    public static let onFly = UnderLineTextFieldValidateType(rawValue: 1 << 0)
    /// after textfield resign first responder
    public static let afterEdit = UnderLineTextFieldValidateType(rawValue: 1 << 1)
    /// whenever validate() gets called
    public static let onCommit = UnderLineTextFieldValidateType(rawValue: 1 << 2)
    /// allways validate, when activated, when changed, when deactivated
    public static let always = UnderLineTextFieldValidateType(rawValue: 1 << 2)

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}

