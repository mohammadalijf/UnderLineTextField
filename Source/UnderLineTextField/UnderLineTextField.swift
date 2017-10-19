//
//  UnderLineTextField.swift
//  UnderLineTextField
//
//  Created by Mohammad Ali Jafarian on 16/10/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import UIKit
import QuartzCore

/// Simple UITextfield Subclass with state
@IBDesignable
public class UnderLineTextField: UITextField {

    //============
    // MARK: - inits
    //============
    override init(frame: CGRect) {
        super.init(frame: frame)
        initilize()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initilize()
    }
    private func initilize() {
        borderStyle = .none
        placeholder = super.placeholder
        tintColor = super.tintColor
        super.placeholder = nil
        clearButtonMode = super.clearButtonMode
        placeholderLabel.text = placeholder
        errorLabel.text = ""
        addTarget(self, action: #selector(self.formTextFieldDidBeginEditing), for: .editingDidBegin)
        addTarget(self, action: #selector(self.formTextFieldDidEndEditing), for: .editingDidEnd)
        addTarget(self, action: #selector(self.formTextFeildValueChanged), for: [.editingChanged, .valueChanged])
        NSLayoutConstraint.activate(neededConstraint)
        adjustHeight()
        errorLabel.alpha = 0
        initialLayout = true
    }

    //=================
    // MARK: - Variables
    //=================
    /// current status of control
    public var status: UnderLineTextFieldStatus = .inactive {
        didSet {
            switch status {
            case .error(let message), .warning(let message):
                errorLabel.text = message
                isErrorLabelVisibile = true
                animatePlaceholderColor()
            default:
                isErrorLabelVisibile = false
            }
            setNeedsDisplay()
        }
    }
    /// text color of placeholder
    var placeholderColor: UIColor! {
        if isPlaceholderUp == true {
            switch status {
            case .error:
                return errorPlaceholderColor
            case .warning:
                return warningPlaceholderColor
            default:
                break
            }
            return activePlaceholderTextColor
        }
        return inactivePlaceholderTextColor
    }
    /// animation duration for changing states
    public var animationDuration: Double = 0.3
    // flag for first initial of layout
    private var initialLayout: Bool = false
    /// constraints that will be activated upon initilization
    private var neededConstraint = [NSLayoutConstraint]()
    /// set height of control
    private var heightConstraint: NSLayoutConstraint!
    /// change status of placeholder position
    private var isPlaceholderUp: Bool = false {
        didSet {
            guard oldValue != isPlaceholderUp else {
                return
            }
            setPlaceholderUp(isUp: isPlaceholderUp, isAnimated: true)
        }
    }
    /// should show error label
    private var isErrorLabelVisibile = false {
        didSet {
            if oldValue != isErrorLabelVisibile {
                errorLabel.changeText(toColor: errorLabelColor,
                                      animated: false)
                UIView.animate(withDuration: animationDuration,
                               animations: {
                                self.errorLabel.alpha = self.isErrorLabelVisibile ? 1 : 0
                })
            }
        }
    }
    ///
    private var errorLabelColor: UIColor {
        switch self.status {
        case .warning:
            return warningTextColor
        default:
            return errorTextColor
        }
    }
    /// current color of control base on it's status
    private var lineColor: UIColor {
        switch self.status {
        case .inactive:
            return inactiveLineColor
        case .active:
            return activeLineColor
        case .warning:
            return warningLineColor
        case .error:
            return errorLineColor
        }
    }
    /// current width of control line base on it's status
    private var lineWidth: CGFloat {
        switch self.status {
        case .inactive:
            return inactiveLineWidth
        case .active:
            return activeLineWidth
        case .warning:
            return warningLineWidth
        case .error:
            return errorLineWidth
        }
    }

    //=====================
    // MARK: Lazy Loadings
    //=====================
    private lazy var clearButton: UIButton = {
        let button = UIButton(type: .custom)
        let bundle = Bundle.init(for: UnderLineTextField.self)
        let clearImage = UIImage(named: "Clear",
                                 in: bundle,
                                 compatibleWith: nil)
        button.setImage(clearImage, for: .normal)
        button.setImage(clearImage, for: .highlighted)
        button.addTarget(self, action: #selector(self.clearText), for: .touchUpInside)
        button.tintColor = tintColor
        button.sizeToFit()
        rightView = button
        return button
    }()
    /// layer which line will be drawn on it
    private lazy var lineLayer: CAShapeLayer = {
        let layer = CAShapeLayer(layer: self.layer)
        layer.lineCap = kCALineCapRound
        layer.strokeColor = lineColor.cgColor
        layer.lineWidth = lineWidth
        return layer
    }()
    /// label for displaying error
    private lazy var errorLabel: UIAnimatableLabel = {
        let label = UIAnimatableLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.animationDuration = animationDuration
        if let fontName = font?.familyName, let size = font?.pointSize {
            label.font = UIFont(name: fontName, size: size * 0.8)
        }
        addSubview(label)
        neededConstraint.append(NSLayoutConstraint(item: label,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 0))
        neededConstraint.append(NSLayoutConstraint(item: label,
                                                   attribute: .bottom,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .bottom,
                                                   multiplier: 1,
                                                   constant: 0))
        neededConstraint.append(NSLayoutConstraint(item: label,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .trailing,
                                                   multiplier: 1,
                                                   constant: 0))
        return label
    }()
    /// label for displaying placeholder
    private lazy var placeholderLabel: UIAnimatableLabel = {
        let label = UIAnimatableLabel()
        label.font = self.font
        label.translatesAutoresizingMaskIntoConstraints = false
        label.animationDuration = animationDuration
        addSubview(label)
        neededConstraint.append(NSLayoutConstraint(item: label,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 0))
        neededConstraint.append(NSLayoutConstraint(item: label,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .centerY,
                                                   multiplier: 1,
                                                   constant: 0))
        return label
    }()

    //===================
    // MARK: IBInspectable
    //===================
    //==================
    // MARK: Active State
    //==================
    /// line width when textfield is focused
    @IBInspectable public var activeLineWidth: CGFloat = 1 {
        didSet {
            if oldValue != activeLineWidth {
                setNeedsDisplay()
            }
        }
    }
    /// placeholder color when textfield is focused
    @IBInspectable public var activePlaceholderTextColor: UIColor = .lightGray {
        didSet {
            if oldValue != activePlaceholderTextColor {
                setNeedsDisplay()
            }
        }
    }
    /// line color when textfield is focused
    @IBInspectable public var activeLineColor: UIColor = .darkText {
        didSet {
            if oldValue != activeLineColor {
                setNeedsDisplay()
            }
        }
    }

    //====================
    // MARK: Inactive Satuts
    //====================
    /// line width when textfield is not focused
    @IBInspectable public var inactiveLineWidth: CGFloat = 1 {
        didSet {
            if oldValue != inactiveLineWidth {
                setNeedsDisplay()
            }
        }
    }
    /// placeholder color when textfield is not focused
    @IBInspectable public var inactivePlaceholderTextColor: UIColor = .darkText {
        didSet {
            if oldValue != inactivePlaceholderTextColor {
                setNeedsDisplay()
            }
        }
    }
    /// line color when textfield is not focused
    @IBInspectable public var inactiveLineColor: UIColor = .lightGray {
        didSet {
            if oldValue != inactiveLineColor {
                setNeedsDisplay()
            }
        }
    }

    //====================
    // MARK: Warning Status
    //====================
    /// line width when textfield have warning
    @IBInspectable public var warningLineWidth: CGFloat = 1 {
        didSet {
            if oldValue != warningLineWidth {
                setNeedsDisplay()
            }
        }
    }
    /// placeholder color when textfield have warning
    @IBInspectable public var warningPlaceholderColor: UIColor = UIColor.yellow {
        didSet {
            if oldValue != warningPlaceholderColor {
                setNeedsDisplay()
            }
        }
    }
    /// warrning label color when textfield have warning
    @IBInspectable public var warningTextColor: UIColor = UIColor.yellow {
        didSet {
            if oldValue != warningTextColor {
                setNeedsDisplay()
            }
        }
    }
    /// line color when textfield have warning
    @IBInspectable public var warningLineColor: UIColor = UIColor.yellow {
        didSet {
            if oldValue != warningLineColor {
                errorLabel.textColor = errorLineColor
                setNeedsDisplay()
            }
        }
    }

    //==================
    // MARK: Error Status
    //==================
    /// line width when textfield have error
    @IBInspectable public var errorLineWidth: CGFloat = 1 {
        didSet {
            if oldValue != errorLineWidth {
                setNeedsDisplay()
            }
        }
    }
    /// placeholder color when textfield have error
    @IBInspectable public var errorPlaceholderColor: UIColor = UIColor.red {
        didSet {
            if oldValue != errorPlaceholderColor {
                setNeedsDisplay()
            }
        }
    }
    /// error label color when textfield have warning
    @IBInspectable public var errorTextColor: UIColor = UIColor.yellow {
        didSet {
            if oldValue != warningTextColor {
                setNeedsDisplay()
            }
        }
    }
    /// line color when textfield have error
    @IBInspectable public var errorLineColor: UIColor = UIColor.red {
        didSet {
            if oldValue != errorLineColor {
                errorLabel.textColor = errorLineColor
                setNeedsDisplay()
            }
        }
    }
}

//=================
// MARK: - Overrides
//=================
extension UnderLineTextField {
    override public var text: String? {
        get {
            return super.text
        }
        set {
            super.text = newValue
            isPlaceholderUp = text?.isEmpty == false
            setNeedsDisplay()
        }
    }

    override public var placeholder: String? {
        set {
            placeholderLabel.text = newValue
        }
        get {
            return placeholderLabel.text
        }
    }

    override public var font: UIFont? {
        set {
            super.font = newValue
            adjustHeight()
            if let fontName = font?.familyName, let size = font?.pointSize {
                errorLabel.font = UIFont(name: fontName, size: size * 0.8)
            }
        }
        get {
            return super.font
        }
    }

    override public var clearButtonMode: UITextFieldViewMode {
        set {
            rightViewMode = newValue
        }
        get {
            return rightViewMode
        }
    }

    override public var tintColor: UIColor! {
        set {
            super.tintColor = newValue
            clearButton.tintColor = newValue
        }
        get {
            return super.tintColor
        }
    }

    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        if lineLayer.superlayer == nil {
            layer.addSublayer(lineLayer)
        }
        aniamteLineColor()
        lineLayer.lineWidth = lineWidth
        placeholderLabel.textColor = placeholderColor
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        lineLayer.path = createLinePath().cgPath
        setNeedsDisplay()
        if initialLayout {
            if text?.isEmpty ?? true {
                isPlaceholderUp = false
            } else {
                isPlaceholderUp = true
            }
            initialLayout = false
        }
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initilize()
    }
}

//================
// MARK: - Methods
//================
extension UnderLineTextField {
    /// adjust height constraint of control base on font size
    func adjustHeight() {
        let heightLine = (font?.pointSize ?? 0) + 8
        let height =  heightLine + heightLine * 1.6 + 14
        if heightConstraint == nil {
            heightConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: height)
            heightConstraint.isActive = true
        }
        heightConstraint.constant = height
        layoutIfNeeded()
    }
    ///
    private func setPlaceholderUp(isUp: Bool, isAnimated: Bool) {
        if isUp {
            var xTransform = placeholderLabel.bounds.width * 0.15
            xTransform *= -1
            let label = self.placeholderLabel
            guard isAnimated else {
                placeholderLabel.textColor = placeholderColor
                label.transform = label.transform.scaledBy(x: 0.8, y: 0.8)
                label.transform = label
                    .transform
                    .translatedBy(x: xTransform,
                                  y: label.frame.origin.y * -1)
                return
            }
            UIView.animate(withDuration: animationDuration, animations: {
                label.transform = label.transform.scaledBy(x: 0.8, y: 0.8)
                label.transform = label
                    .transform
                    .translatedBy(x: xTransform,
                                  y: label.frame.origin.y * -1)
            })
        } else {
            guard isAnimated else {
                placeholderLabel.textColor = placeholderColor
                self.placeholderLabel.transform = .identity
                return
            }
            UIView.animate(withDuration: animationDuration, animations: {
                self.placeholderLabel.transform = .identity
            })
            animatePlaceholderColor()
        }
    }
    /// animate linecolor
    private func aniamteLineColor() {
        let animation = CABasicAnimation(keyPath: "strokeColor")
        animation.duration = animationDuration
        animation.isRemovedOnCompletion = true
        lineLayer.add(animation, forKey: "strokeColorChange")
        lineLayer.strokeColor = lineColor.cgColor
    }
    /// animate placeholderColor
    private func animatePlaceholderColor() {
        placeholderLabel.changeText(toColor: placeholderColor,
                                    animated: true)
    }
    /// create line bezier path
    private func createLinePath() -> UIBezierPath {
        let path = UIBezierPath()
        let heightLine = (font?.pointSize ?? 0) + 8
        let padding = heightLine + heightLine * 0.8 + 9
        path.move(to: CGPoint(x: 0, y: padding))
        path.addLine(to: CGPoint(x: bounds.maxX, y: padding))
        return path
    }
}

//=================
// MARK: - Selectors
//=================
@objc extension UnderLineTextField {
    /// clear text on control
    private func clearText() {
        guard delegate?.textFieldShouldClear?(self) ?? true else {
            return
        }
        text = ""
        self.isPlaceholderUp = false
        (delegate as? UnderLineTextFieldDelegate)?.textFieldTextChanged(underLineTextField: self)
    }
    /// textfield become first responder
    private func formTextFieldDidBeginEditing() {
        layoutIfNeeded()
        status = .active
    }
    /// textfield resigned first responder
    private func formTextFieldDidEndEditing() {
        layoutIfNeeded()
        status = .inactive
        try? (delegate as? UnderLineTextFieldDelegate)?.textFieldValidate(underLineTextField: self)
    }
    /// textfield value changed
    private func formTextFeildValueChanged() {
        (delegate as? UnderLineTextFieldDelegate)?.textFieldTextChanged(underLineTextField: self)
        guard let text = text, !text.isEmpty else {
            isPlaceholderUp = false
            return
        }
        isPlaceholderUp = true
    }
}
