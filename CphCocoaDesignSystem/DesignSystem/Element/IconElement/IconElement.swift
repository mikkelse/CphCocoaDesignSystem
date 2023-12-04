//
//  IconElement.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 30/11/2023.
//

import UIKit

/// A type representing an icon element in a `Section`.
struct Icon: Element {
    
    let asset: IconAsset
    
    init(_ asset: IconAsset) {
        self.asset = asset
    }
    
    func createView() -> UIView {
        IconElementView(self)
    }
}
