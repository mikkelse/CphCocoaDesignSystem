//
//  CGFloat+Constants.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 30/11/2023.
//

import UIKit

extension CGFloat {
    
    /// An enum defining the different spacings used throught the app.
    enum Spacing {
        /// The small spacing used inside elements.
        static let small = 4.0
        /// The medium spacing used inside elements.
        static let medium = 8.0
        /// The large spacing used inside elements.
        static let large = 16.0
        /// The spacing used between elements in a section.
        static let elements = 16.0
        /// The spacing used between sections in a content
        static let sections = 32.0
        /// The spacing used between content and the edge of the screen.
        static let margin = 32.0
        /// The spacing used between content and the bottom of the screen.
        static let bottomMargin = hasNotch ? 16.0 : 32.0
    }
    
    enum Sizing {
        static let iconSize = 40.0
        static let iconElementHeight = 96.0
        static let borderWidth = 2.0
        static let defaultElementHeight = 48.0
        static let buttonCornerRadius = 25.0
    }
}

private var hasNotch: Bool {
    let keyWindow = UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first { $0.isKeyWindow }
    guard let keyWindow else { return false }
    return keyWindow.safeAreaInsets.bottom > 0
}
