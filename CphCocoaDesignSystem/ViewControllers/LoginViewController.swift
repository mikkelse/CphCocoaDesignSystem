//
//  LoginViewController.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 03/12/2023.
//

import UIKit
import Combine

class LoginViewController: ScrollingContentViewController {
    
    private var subscriptions = Set<AnyCancellable>()
    private let nameField: TextField
    private let button: Button
    
    init(completion: @escaping () -> Void) {
        
        let button = Button("login_screen_button_title".localized) { completion() }
        
        let passField = TextField("login_screen_pass_field_title".localized, isSecure: true) { field in
            field.isEditing = false
        }
        let nameField = TextField("login_screen_name_field_title".localized) { _ in
            passField.isEditing = true
        }
        
        let topContent = Content {
            Section {
                Icon(.lock)
            }
            Section {
                nameField
                passField
                CheckBox("login_screen_name_box_title".localized)
            }
        }
        
        let bottomContent = Content {
            Section {
                button
            }
        }
        
        self.nameField = nameField
        self.button = button
        
        super.init(topContent: topContent, bottomContent: bottomContent)
        
        nameField.$text
            .sink { [unowned self] name in
                self.validateInput(name: name, password: passField.text)
            }
            .store(in: &subscriptions)
        
        passField.$text
            .sink { [unowned self] password in
                self.validateInput(name: nameField.text, password: password)
            }
            .store(in: &subscriptions)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameField.isEditing = true
    }
    
    // MARK: - Private interface
    
    private func validateInput(name: String?, password: String?) {
        guard let name, let password else {
            button.isEnabled = false
            return
        }
        button.isEnabled = !name.isEmpty && !password.isEmpty
    }
}
