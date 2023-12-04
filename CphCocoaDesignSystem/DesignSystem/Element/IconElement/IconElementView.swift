//
//  IconElementView.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 30/11/2023.
//

import UIKit

class IconElementView: UIView {
    
    init(_ icon: Icon) {
        super.init(frame: .zero)
        setup(with: icon)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
    
    private func setup(with icon: Icon) {
        
        let imageView = UIImageView(image: icon.asset.image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .content
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: .Sizing.iconElementHeight),
            imageView.heightAnchor.constraint(equalToConstant: .Sizing.iconSize),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

