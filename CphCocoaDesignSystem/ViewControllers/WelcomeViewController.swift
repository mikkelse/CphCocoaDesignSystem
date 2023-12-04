//
//  WelcomeViewController.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import UIKit
import Combine

class WelcomeViewController: ScrollingContentViewController {
    
    private var subscriptions = Set<AnyCancellable>()

    init(completion: @escaping () -> Void) {
        
        let topContent = Content {
            Section {
                Icon(.info)
            }
            Section {
                Text(.title, "welcome_screen_title".localized)
                Text(.header, "welcome_screen_header1".localized)
                Text(.body, "welcome_screen_body1".localized)
                Text(.header, "welcome_screen_header2".localized)
                Text(.body, "welcome_screen_body2".localized)
            }
        }
        
        let button = Button("welcome_screen_button_title".localized, isEnabled: false, action: completion)
        let checkBox = CheckBox("welcome_screen_checkbox_title".localized)
        
        let bottomContent = Content {
            Section {
                checkBox
                button
            }
        }
        
        super.init(topContent: topContent, bottomContent: bottomContent)
        
        // MARK: - Setup bindings
        
        checkBox.$isChecked
            .sink { isChecked in
                button.isEnabled = isChecked
            }
            .store(in: &subscriptions)
    }
}

