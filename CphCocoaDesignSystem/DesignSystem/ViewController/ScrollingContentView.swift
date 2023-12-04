//
//  ScrollingContentView.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import UIKit 

/// A scrollview representing a given `Content`.
final class ScrollingContentView: UIScrollView {

    private let contentView: ContentView
    
    init(with content: Content) {
        self.contentView = ContentView(content)
        super.init(frame: .zero)
        setup(with: content)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
    
    private func setup(with content: Content) {
        
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            contentView.centerXAnchor.constraint(equalTo: contentLayoutGuide.centerXAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }
}
