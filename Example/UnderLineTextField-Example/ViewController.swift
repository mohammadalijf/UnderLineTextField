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
    @IBOutlet weak var bigFontTextfield: UnderLineTextField!
    @IBOutlet weak var clearButtonTextfield: UnderLineTextField!
    @IBOutlet var formFields: [UnderLineTextField]! {
        didSet {
            formFields.forEach { $0.delegate = self }
        }
    }
    @IBOutlet weak var sixCharTextField: UnderLineTextField! {
        didSet {
            sixCharTextField.validationType = .always
        }
    }
    @IBOutlet weak var warningTextField: UnderLineTextField! {
        didSet {
            warningTextField.validationType = .always
        }
    }
    @IBOutlet weak var alwaysComplainTextfield: UnderLineTextField! {
        didSet {
            alwaysComplainTextfield.validationType = .always
        }
    }
    @IBOutlet weak var onFlyComplainTextfield: UnderLineTextField! {
        didSet {
            onFlyComplainTextfield.validationType = .onFly
        }
    }
    @IBOutlet weak var afterEditComplainTextfield: UnderLineTextField! {
        didSet {
            afterEditComplainTextfield.validationType = .afterEdit
        }
    }
    
    @IBOutlet weak var customFontsTextfield: UnderLineTextField! {
        didSet {
            customFontsTextfield.placeholderFont = UIFont(name: "American Typewriter", size: 30)
            customFontsTextfield.errorFont = UIFont(name: "Bradley Hand", size: 17)
            customFontsTextfield.validationType = .onFly
        }
    }
    
    private var keyboardObserver: KeyboardObserver!

}

extension ViewController {

    //=================
    // MARK: - Overrides
    //=================
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardObserver = .init(view: view, constraint: scrollViewBottomConstraint)
        keyboardObserver.addNotification()
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
        case customFontsTextfield:
            guard underLineTextField.text?.isEmpty == false else { return }
            throw UnderLineTextFieldErrors.warning(message: "Fancy Font")
        default:
            break
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let nextTextField = view.viewWithTag(textField.tag + 1) else {
            view.endEditing(true)
            return false
        }
        _ = nextTextField.becomeFirstResponder()
        return false
    }

    func textFieldTextChanged(underLineTextField: UnderLineTextField) {
        print("im empty \(underLineTextField)")
    }

}
