//
//  TextElementView.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import UIKit

class TextElementView: UIView {
    
    init(_ textElement: Text) {
        super.init(frame: .zero)
        setup(with: textElement)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
    
    private func setup(with textElement: Text) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .content
        label.attributedText = textElement.style.attributedString(textElement.value)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
