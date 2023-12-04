//
//  TextElement.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import UIKit

/// A type representing a text element in a `Section`.
struct Text: Element {
    
    let value: String
    let style: TextStyle
    
    init(_ style: TextStyle, _ value: String) {
        self.value = value
        self.style = style
    }
    
    func createView() -> UIView {
        TextElementView(self)
    }
}
