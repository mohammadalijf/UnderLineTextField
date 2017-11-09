//
//  UnderLineTextFieldDesignbale.swift
//  carthage test
//
//  Created by Mohammad Ali Jafarian on 11/9/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import UnderLineTextField

@IBDesignable
open class UnderLineTextFieldCarthage: UnderLineTextField {

    //=================
    // MARK: - Variables
    //=================
    //===================
    // MARK: IBInspectable
    //===================
    //==================
    // MARK: Active State
    //==================
    /// line width when textfield is focused
    @IBInspectable override open var activeLineWidth: CGFloat {
        set {
            super.activeLineWidth = newValue
        }
        get {
            return super.activeLineWidth
        }
    }
    /// placeholder color when textfield is focused
    @IBInspectable open override var activePlaceholderTextColor: UIColor {
        set {
            super.activePlaceholderTextColor = newValue
        }
        get {
            return super.activePlaceholderTextColor
        }
    }
    /// line color when textfield is focused
    @IBInspectable override open var activeLineColor: UIColor {
        set {
            super.activeLineColor = newValue
        }
        get {
            return super.activeLineColor
        }
    }

    //====================
    // MARK: Inactive Satuts
    //====================
    /// line width when textfield is not focused
    @IBInspectable override open var inactiveLineWidth: CGFloat {
        set {
            super.inactiveLineWidth = newValue
        }
        get {
            return super.inactiveLineWidth
        }
    }
    /// placeholder color when textfield is not focused
    @IBInspectable override open var inactivePlaceholderTextColor: UIColor {
        set {
            super.inactivePlaceholderTextColor = newValue
        }
        get {
            return super.inactivePlaceholderTextColor
        }
    }
    /// line color when textfield is not focused
    @IBInspectable override open var inactiveLineColor: UIColor {
        set {
            super.inactiveLineColor = newValue
        }
        get {
            return super.inactiveLineColor
        }
    }

    //====================
    // MARK: Warning Status
    //====================
    /// line width when textfield have warning
    @IBInspectable override open var warningLineWidth: CGFloat {
        set {
            super.warningLineWidth = newValue
        }
        get {
            return super.warningLineWidth
        }
    }
    /// placeholder color when textfield have warning
    @IBInspectable override open var warningPlaceholderColor: UIColor {
        set {
            super.warningPlaceholderColor = newValue
        }
        get {
            return super.warningPlaceholderColor
        }
    }
    /// warrning label color when textfield have warning
    @IBInspectable override open var warningTextColor: UIColor {
        set {
            super.warningTextColor = newValue
        }
        get {
            return super.warningTextColor
        }
    }
    /// line color when textfield have warning
    @IBInspectable override open var warningLineColor: UIColor {
        set {
            super.warningLineColor = newValue
        }
        get {
            return super.warningLineColor
        }
    }

    //==================
    // MARK: Error Status
    //==================
    /// line width when textfield have error
    @IBInspectable override open var errorLineWidth: CGFloat {
        set {
            super.errorLineWidth = newValue
        }
        get {
            return super.errorLineWidth
        }
    }
    /// placeholder color when textfield have error
    @IBInspectable override open var errorPlaceholderColor: UIColor {
        set {
            super.errorPlaceholderColor = newValue
        }
        get {
            return super.errorPlaceholderColor
        }
    }
    /// error label color when textfield have warning
    @IBInspectable override open var errorTextColor: UIColor {
        set {
            super.errorTextColor = newValue
        }
        get {
            return super.errorTextColor
        }
    }
    /// line color when textfield have error
    @IBInspectable override open var errorLineColor: UIColor {
        set {
            super.errorLineColor = newValue
        }
        get {
            return super.errorLineColor
        }
    }


}
