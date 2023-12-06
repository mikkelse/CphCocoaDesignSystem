//
//  CheckBox.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 03/12/2023.
//

import UIKit

/// A type representing a check box element in a `Section`.
class CheckBox: Element {
    
    let title: String
    
    @Published var isChecked: Bool

    init(_ title: String, isChecked: Bool = false) {
        self.title = title
        self.isChecked = isChecked
    }
    
    func createView() -> UIView {
        CheckBoxElementView(self)
    }
}
