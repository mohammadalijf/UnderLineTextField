//
//  KeyboardObserver.swift
//  UnderLineTextField-Example
//
//  Created by Mohammad Ali Jafarian on 8/18/18.
//  Copyright © 2018 Mohammad Ali Jafarian. All rights reserved.
//

import UIKit

/// Handles Keyboard for scrollViews
class KeyboardObserver {
    
    weak var constraint: NSLayoutConstraint!
    weak var view: UIView!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    init(view: UIView, constraint: NSLayoutConstraint?) {
        self.constraint = constraint
        self.view = view
    }
    
    /// add notificaiton observer for keyboard changes
    func addNotification() {
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(self.keyboardNotification(notification:)),
                         name: UIResponder.keyboardWillChangeFrameNotification,
                         object: nil)
    }

}



@objc extension KeyboardObserver {
    
    //==================
    // MARK: - Selectors
    //==================
    private func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration: TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
            let animationCurve: UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
            if (endFrame?.origin.y)! >= UIScreen.main.bounds.size.height {
                self.constraint.constant = 0.0
            } else {
                self.constraint.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: { self.view.layoutIfNeeded() },
                           completion: nil)
        }
    }

}
