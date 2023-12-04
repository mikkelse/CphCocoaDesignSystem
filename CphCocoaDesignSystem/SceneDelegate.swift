//
//  SceneDelegate.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 27/11/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var coordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let navigationController = navigationController()
        coordinator = AppCoordinator(navigationController: navigationController)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowScene = scene
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
    }
    
    // MARK: - Setup navigation controller
    
    private func navigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.tintColor = .accent
        return navigationController
    }
}

