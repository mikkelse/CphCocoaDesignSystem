//
//  Element.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import UIKit

/// A type representing an element in a `Section`.
protocol Element {

    /// Create a view representing the element.
    func createView() -> UIView
}
