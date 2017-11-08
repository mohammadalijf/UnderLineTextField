//
//  UnderLineTextFieldContentStatus.swift
//  UnderLineTextField
//
//  Created by Mohammad Ali Jafarian on 11/9/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import Foundation

/// FromTextField statuses
public struct UnderLineTextFieldContentStatus: OptionSet {
    public let rawValue: UInt
    public static let filled = UnderLineTextFieldContentStatus(rawValue: 1 << 0)
    public static let empty = UnderLineTextFieldContentStatus(rawValue: 1 << 1)
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}
