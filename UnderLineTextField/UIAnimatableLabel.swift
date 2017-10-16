//
//  UIAnimatableLabel.swift
//  UnderLineTextField
//
//  Created by Mohammad Ali Jafarian on 16/10/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import UIKit

@IBDesignable
class UIAnimatableLabel: UIView {

    //=================
    // MARK: - Variables
    //=================
    private var textFont = UIFont.systemFont(ofSize: 15)
    private var widthConstraint: NSLayoutConstraint!
    private var heightConstraint: NSLayoutConstraint!
    private var dummyLabel: UILabel = {
        UILabel()
    }()
    var text: String? {
        set {
            let newText: NSString = NSString(string: newValue ?? "")
            let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
            let boundingRect = newText.boundingRect(with: constraintRect,
                                                    options: .usesLineFragmentOrigin,
                                                    attributes: [.font: font],
                                                    context: nil)
            widthConstraint.constant = boundingRect.width
            heightConstraint.constant = boundingRect.height
            textLayer.string = newValue
            layoutIfNeeded()
        }
        get {
            return textLayer.string as? String
        }

    }
    var textColor: UIColor! {
        set {
            textLayer.foregroundColor = newValue.cgColor
        }
        get {
            guard let cgColor = textLayer.foregroundColor else {
                return .clear
            }
            return UIColor(cgColor: cgColor)
        }
    }
    var font: UIFont! {
        set {
            textFont = newValue
            let fontName = newValue.fontName as NSString
            textLayer.font = CGFont.init(fontName)
            textLayer.fontSize = newValue.pointSize
        }
        get {
            return textFont
        }
    }

    var textLayer: CATextLayer = {
        let textLayer = CATextLayer()
        textLayer.contentsScale = UIScreen.main.scale
        return textLayer
    }()

    //=================
    // MARK: - Overrides
    //=================
    override var backgroundColor: UIColor? {
        set {
            super.backgroundColor = newValue
            textLayer.backgroundColor = newValue?.cgColor
        }
        get {
            return super.backgroundColor
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initial()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textLayer.frame = self.bounds
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return nil
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initial()
    }

    //===========================
    // MARK: - Methods & Selectors
    //===========================
    private func initial() {
        widthConstraint = NSLayoutConstraint(item: self,
                                             attribute: .width,
                                             relatedBy: .equal,
                                             toItem: nil,
                                             attribute: .notAnAttribute,
                                             multiplier: 1,
                                             constant: dummyLabel.bounds.width)
        heightConstraint = NSLayoutConstraint(item: self,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1,
                                              constant: dummyLabel.bounds.height)
        self.layer.addSublayer(textLayer)
        NSLayoutConstraint.activate([heightConstraint, widthConstraint])
    }
}
