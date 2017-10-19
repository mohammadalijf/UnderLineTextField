//
//  UnderLineTextFieldStatus.swift
//  UnderLineTextField
//
//  Created by Mohammad Ali Jafarian on 10/19/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import Foundation

/// FromTextField statuses
public enum UnderLineTextFieldStatus {
    /// when control is focused
    case active
    /// when control have warning
    case warning(message: String)
    /// when control have errors
    case error(message: String)
    /// when control is not focused
    case inactive
}
