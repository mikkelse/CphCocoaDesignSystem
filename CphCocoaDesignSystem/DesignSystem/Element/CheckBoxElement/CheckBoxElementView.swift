//
//  CheckBoxElementView.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 03/12/2023.
//

import UIKit
import Combine

class CheckBoxElementView: UIView {
    
    private var subscriptions = Set<AnyCancellable>()
    private let checkBox: CheckBox
    
    init(_ checkBox: CheckBox) {
        self.checkBox = checkBox
        super.init(frame: .zero)
        setup(with: checkBox)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
    
    private func setup(with checkBox: CheckBox) {

        let textLabel = Text(.bodyBold, checkBox.title).createView()
        textLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        let imageView = UIImageView()
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.tintColor = .content
        imageView.contentMode = .center

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = .Spacing.elements
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(imageView)

        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            heightAnchor.constraint(equalToConstant: .Sizing.defaultElementHeight)
        ])
        
        checkBox.$isChecked
            .sink { isChecked in
                imageView.image = if isChecked { .iconBoxChecked } else { .iconBoxUnchecked }
            }
            .store(in: &subscriptions)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tap)
    }
    
    @objc
    private func viewTapped() {
        checkBox.isChecked.toggle()
    }
}
