//
//  File.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 03/12/2023.
//

import UIKit
import Combine

class TextFieldElementView: UIView {
    
    private var subscriptions = Set<AnyCancellable>()
    private let field: TextField
    
    init(_ field: TextField) {
        self.field = field
        super.init(frame: .zero)
        setup(with: field)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
    
    private func setup(with field: TextField) {
        
        let titleLabel = Text(.formLabel, field.title).createView()
        let textField = CustomTextField(isSecure: field.isSecure)
        textField.delegate = self

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = .Spacing.medium

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textField)
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: textField)
            .map { ($0.object as? UITextField)?.text }
            .sink { text in field.text = text }
            .store(in: &subscriptions)
        
        field.$isEditing
            .sink { isEditing in
                if isEditing {
                    textField.becomeFirstResponder()
                    textField.backgroundColor = .selected
                } else {
                    textField.resignFirstResponder()
                    textField.backgroundColor = .background
                }
            }
            .store(in: &subscriptions)
    }

}

extension TextFieldElementView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        field.returnHandler?()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        field.isEditing = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        field.isEditing = true
    }
}

private class CustomTextField: UITextField {
    
    let textStyle = TextStyle.bodyBold
    
    init(isSecure: Bool) {
        super.init(frame: .zero)
        tintColor = .accent
        isSecureTextEntry = isSecure
        layer.borderWidth = .Sizing.borderWidth
        layer.borderColor = UIColor.border.cgColor
        defaultTextAttributes = textStyle.attributedString(" ").attributes(at: 0, effectiveRange: nil)
        textColor = .content
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        adjustedRect(forBounds: bounds)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        adjustedRect(forBounds: bounds)
    }
    
    private func adjustedRect(forBounds bounds: CGRect) -> CGRect {
        let offSet = textStyle.definition.baseLineOffset
        let insets = UIEdgeInsets(top: .Spacing.large - offSet, left: .Spacing.medium, bottom: .Spacing.large + offSet, right: .Spacing.medium)
        return bounds.inset(by: insets)
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        var caretRect = super.caretRect(for: position)
        caretRect.size.height = TextStyle.bodyBold.definition.lineHeight
        return caretRect
    }
}
