//
//  CustomElement.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 03/12/2023.
//

import UIKit

/// A type representing a custom element in a `Section`.
struct Custom: Element {
    
    let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    func createView() -> UIView {
        return view
    }
}
