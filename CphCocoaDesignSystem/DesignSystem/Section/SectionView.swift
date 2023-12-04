//
//  SectionView.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import UIKit

/// A view representing a section in a `ContentView`.
final class SectionView: UIView {
    
    init(_ section: Section) {
        super.init(frame: .zero)
        setup(with: section)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
    
    private func setup(with section: Section) {

        translatesAutoresizingMaskIntoConstraints = false
        
        let sectionStackView = UIStackView()
        sectionStackView.translatesAutoresizingMaskIntoConstraints = false
        sectionStackView.axis = .vertical
        sectionStackView.spacing = .Spacing.elements
        
        addSubview(sectionStackView)
        
        NSLayoutConstraint.activate([
            sectionStackView.topAnchor.constraint(equalTo: topAnchor),
            sectionStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        section.elements.forEach { element in
            let elementView = element.createView()
            sectionStackView.addArrangedSubview(elementView)
        }
    }
}
