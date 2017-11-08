//
//  ViewController.swift
//  UnderLineTextField-Example
//
//  Created by Mohammad Ali Jafarian on 10/17/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import UIKit
import UnderLineTextField

class ViewController: UIViewController {

    //=================
    // MARK: - Variables
    //=================
    
    //===============
    // MARK: Outlets
    //===============
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var normalTextField: UnderLineTextField!
    @IBOutlet weak var prefilledTextfield: UnderLineTextField!
    @IBOutlet weak var sixCharTextField: UnderLineTextField!
    @IBOutlet weak var warningTextField: UnderLineTextField!
    @IBOutlet weak var alwaysComplainTextfield: UnderLineTextField!
    @IBOutlet weak var onFlyComplainTextfield: UnderLineTextField!
    @IBOutlet weak var afterEditComplainTextfield: UnderLineTextField!
    @IBOutlet weak var bigFontTextfield: UnderLineTextField!
    @IBOutlet weak var clearButtonTextfield: UnderLineTextField!
    @IBOutlet var formFields: [UnderLineTextField]!

    //=============
    // MARK: - denit
    //=============
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension ViewController {

    //=================
    // MARK: - Overrides
    //=================
    override func viewDidLoad() {
        super.viewDidLoad()
        formFields.forEach({ $0.delegate = self })
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(self.keyboardNotification(notification:)),
                         name: NSNotification.Name.UIKeyboardWillChangeFrame,
                         object: nil)
        warningTextField.validationType = .always
        alwaysComplainTextfield.validationType = .always
        onFlyComplainTextfield.validationType = .onFly
        afterEditComplainTextfield.validationType = .afterEdit
        sixCharTextField.validationType = .always
    }

}

@objc extension ViewController {

    //=================
    // MARK: - Selectors
    //=================
    func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration: TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve: UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            if (endFrame?.origin.y)! >= UIScreen.main.bounds.size.height {
                self.scrollViewBottomConstraint?.constant = 0.0
            } else {
                self.scrollViewBottomConstraint?.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: { self.view.layoutIfNeeded() },
                           completion: nil)
        }
    }

}

extension ViewController: UnderLineTextFieldDelegate {

    //==================================
    // MARK: - UnderLineTextField Delegate
    //==================================
    func textFieldValidate(underLineTextField: UnderLineTextField) throws {
        switch underLineTextField {
        case alwaysComplainTextfield:
            throw UnderLineTextFieldErrors
                .error(message: "i will always complain you no mather what")
        case onFlyComplainTextfield, afterEditComplainTextfield:
            if !underLineTextField.text!.isEmpty {
                throw UnderLineTextFieldErrors
                    .error(message: "dont change me")
            }
        case warningTextField:
            throw UnderLineTextFieldErrors.warning(message: "i will always warn you no mather what")
        case sixCharTextField:
            if sixCharTextField.text!.count < 6 {
                throw UnderLineTextFieldErrors
                    .warning(message: "need \(6 - sixCharTextField.text!.count) more characters")
            } else if sixCharTextField.text!.count > 6 {
                throw UnderLineTextFieldErrors
                    .error(message: "\(sixCharTextField.text!.count - 6) characters is extra")
            }
        default:
            break
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case normalTextField:
            _ = prefilledTextfield.becomeFirstResponder()
        case prefilledTextfield:
            _ = sixCharTextField.becomeFirstResponder()
        case sixCharTextField:
            _ = warningTextField.becomeFirstResponder()
        case warningTextField:
            _ = alwaysComplainTextfield.becomeFirstResponder()
        case alwaysComplainTextfield:
            _ = onFlyComplainTextfield.becomeFirstResponder()
        case onFlyComplainTextfield:
            _ = afterEditComplainTextfield.becomeFirstResponder()
        case afterEditComplainTextfield:
            _ = clearButtonTextfield.becomeFirstResponder()
        case clearButtonTextfield:
            _ = bigFontTextfield.becomeFirstResponder()
        case bigFontTextfield:
            _ = normalTextField.becomeFirstResponder()
        default:
            break
        }
        return false
    }

}
