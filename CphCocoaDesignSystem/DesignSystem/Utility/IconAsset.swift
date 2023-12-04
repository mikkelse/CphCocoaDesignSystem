//
//  UIImage+Constants.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 30/11/2023.
//

import UIKit

enum IconAsset {
    case lock
    case list
    case info
    case sun
    case snow
    case rain
    
    var image: UIImage {
        switch self {
        case .lock:
            UIImage(named: "IconLock")!
        case .list:
            UIImage(named: "IconList")!
        case .info:
            UIImage(named: "IconInfo")!
        case .sun:
            UIImage(named: "IconSun")!
        case .snow:
            UIImage(named: "IconSnow")!
        case .rain:
            UIImage(named: "IconRain")!
        }
    }
}
