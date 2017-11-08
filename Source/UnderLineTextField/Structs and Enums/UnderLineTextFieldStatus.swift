//
//  UnderLineTextFieldStatus.swift
//  UnderLineTextField
//
//  Created by Mohammad Ali Jafarian on 10/19/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import Foundation

/// FromTextField statuses
public struct UnderLineTextFieldStatus: OptionSet {
    public let rawValue: UInt
    public static let warning = UnderLineTextFieldStatus(rawValue: 1 << 0)
    public static let error = UnderLineTextFieldStatus(rawValue: 1 << 1)
    public static let normal = UnderLineTextFieldStatus(rawValue: 1 << 2)

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}


