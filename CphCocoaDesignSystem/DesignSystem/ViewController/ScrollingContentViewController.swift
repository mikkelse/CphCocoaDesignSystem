//
//  ScrollingContentViewController.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import UIKit 

class ScrollingContentViewController: UIViewController {

    init(topContent: Content, bottomContent: Content? = nil) {
        super.init(nibName: nil, bundle: nil)
        setup(topContent: topContent, bottomContent: bottomContent)
    }
    
    @available(*, unavailable) required public init?(coder: NSCoder) { fatalError() }
    
    private func setup(topContent: Content, bottomContent: Content?) {
        
        view.backgroundColor = .background
        
        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.spacing = .Spacing.sections
        
        view.addSubview(contentStackView)
        
        let topContentView = ScrollingContentView(with: topContent)
        contentStackView.addArrangedSubview(topContentView)
        
        let margin = CGFloat.Spacing.margin
        let safeArea = view.safeAreaLayoutGuide
        let bottomAnchor: NSLayoutYAxisAnchor
        let bottomMargin: CGFloat
        
        if let bottomContent {
            let bottomContentView = ContentView(bottomContent)
            contentStackView.addArrangedSubview(bottomContentView)
            bottomAnchor = safeArea.bottomAnchor
            bottomMargin = .Spacing.bottomMargin
        } else {
            topContentView.contentInset.bottom += .Spacing.bottomMargin
            bottomAnchor = view.bottomAnchor
            bottomMargin = 0.0
        }
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin),
            contentStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomMargin),
        ])
    }
}
