//
//  UnderLineTextFieldErrors.swift
//  UnderLineTextField
//
//  Created by Mohammad Ali Jafarian on 11/9/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import Foundation

public enum UnderLineTextFieldErrors: Error {
    case error(message: String?)
    case warning(message: String?)
}
