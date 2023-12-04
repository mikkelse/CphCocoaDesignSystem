//
//  NSString+Localized.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 01/12/2023.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
