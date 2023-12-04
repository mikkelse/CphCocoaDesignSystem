//
//  ContentView.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import UIKit

/// A view representing some content.
final class ContentView: UIView {
    
    init(_ content: Content) {
        super.init(frame: .zero)
        setup(with: content)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
    
    private func setup(with content: Content) {
        
        translatesAutoresizingMaskIntoConstraints = false

        let sectionsStackView = UIStackView()
        sectionsStackView.translatesAutoresizingMaskIntoConstraints = false
        sectionsStackView.axis = .vertical
        sectionsStackView.spacing = .Spacing.sections
        
        addSubview(sectionsStackView)
        
        NSLayoutConstraint.activate([
            sectionsStackView.topAnchor.constraint(equalTo: topAnchor),
            sectionsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        content.sections.forEach { section in
            let sectionView = SectionView(section)
            sectionsStackView.addArrangedSubview(sectionView)
        }
    }
}
