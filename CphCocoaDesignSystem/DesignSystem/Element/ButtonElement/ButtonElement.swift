//
//  ButtonElement.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 02/12/2023.
//

import UIKit

/// A type representing a button element in a `Section`.
class Button: Element {
    
    let title: String
    let action: () -> Void
    
    @Published var isEnabled: Bool
    
    init(_ title: String, isEnabled: Bool = true, action: @escaping () -> Void) {
        self.title = title
        self.isEnabled = isEnabled
        self.action = action
    }
    
    func createView() -> UIView {
        ButtonElementView(self)
    }
}
