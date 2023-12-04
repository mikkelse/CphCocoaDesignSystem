//
//  TextFieldElement.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 03/12/2023.
//

import UIKit

/// A type representing a text field element in a `Section`.
class TextField: Element {
    
    let title: String
    let isSecure: Bool
    let returnHandler: (() -> Void)?
    
    @Published var text: String?
    @Published var isEditing: Bool = false
    
    init(_ title: String, text: String? = nil, isSecure: Bool = false, returnHandler: ((TextField) -> Void)? = nil) {
        
        var _returnHandler: () -> Void = {}
        
        self.returnHandler = { _returnHandler() }
        self.isSecure = isSecure
        self.title = title
        self.text = text
        
        _returnHandler = { [unowned self] in returnHandler?(self) }
    }
    
    func createView() -> UIView {
        TextFieldElementView(self)
    }
}
