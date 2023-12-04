//
//  Section.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import Foundation

/// A type defining a section of elements in a `Content`.
struct Section {
    
    /// The elements that make up the section.
    let elements: [Element]
}

extension Section {
        
    @resultBuilder
    public struct ElementsBuilder {
        public static func buildBlock() -> [Element] { [] }
        public static func buildBlock(_ elements: Element...) -> [Element] { elements }
    }

    public init(@ElementsBuilder _ elements: () -> [Element]) {
        self.elements = elements()
    }
}
