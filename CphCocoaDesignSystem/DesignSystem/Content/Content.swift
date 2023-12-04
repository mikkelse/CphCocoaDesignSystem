//
//  Content.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import Foundation

/// A type representing some content.
struct Content {
    
    /// The list of sections that make up the content.
    let sections: [Section]
}

extension Content {
    
    @resultBuilder
    struct SectionsBuilder {
        static func buildBlock() -> [Section] { [] }
        static func buildBlock(_ sections: Section...) -> [Section] { sections }
    }
    
    init(@SectionsBuilder _ sections: () -> [Section]) {
        self.sections = sections()
    }
}
