//
//  TextStyle.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 01/12/2023.
//

import UIKit

/// An enum defining different styles of text.
enum TextStyle {
    case title
    case header
    case body
    case bodyBold
    case button
    case formLabel
    
    func attributedString(_ text: String) -> NSAttributedString {
        definition.attributedString(text)
    }
}

extension TextStyle {
    
    /// A type representing a definition of a specific `TextStyle`.
    struct Definition {
        let name: String
        let size: CGFloat
        let lineHeight: CGFloat
        let kern: CGFloat
        let upperCased: Bool
    }
    
    var definition: Definition {
        switch self {
        case .title:
            Definition(name: "SFProText-Bold", size: 24.0, lineHeight: 36.0, kern: 0.0, upperCased: false)
        case .header:
            Definition(name: "SFProText-Bold", size: 16.0, lineHeight: 16.0, kern: 0.32, upperCased: false)
        case .body:
            Definition(name: "SFProText-Regular", size: 16.0, lineHeight: 20.8, kern: -0.16, upperCased: false)
        case .bodyBold:
            Definition(name: "SFProText-SemiBold", size: 16.0, lineHeight: 20.8, kern: -0.16, upperCased: false)
        case .button:
            Definition(name: "SFProText-Medium", size: 16.0, lineHeight: 16.0, kern: -0.16, upperCased: true)
        case .formLabel:
            Definition(name: "SFProText-Medium", size: 14.0, lineHeight: 14.0, kern: 0.28, upperCased: false)
        }
    }
}

extension TextStyle.Definition {
    
    var font: UIFont {
        UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    var baseLineOffset: CGFloat {
        (lineHeight - font.lineHeight) * 0.5
    }
    
    func attributedString(_ text: String) -> NSAttributedString {

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.minimumLineHeight = lineHeight
        
        var attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .paragraphStyle: paragraphStyle,
            .baselineOffset: baseLineOffset,
        ]
        
        if kern != 0.0 {
            attributes[.kern] = kern
        }
        
        let text = if upperCased { text.uppercased() } else { text }
        return NSAttributedString(string: text, attributes: attributes)
    }
}
