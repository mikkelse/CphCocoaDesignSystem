//
//  AppCoordinator.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 02/12/2023.
//

import UIKit

/// A class responsible for coordinating the flow of the app.
class AppCoordinator {
    
    private let navigationController: UINavigationController
    private let dataManager = WeatherDataManager()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.showLogin()
    }
    
    private func showLogin() {
        let viewController = LoginViewController { [unowned self] in
            self.showWelcome()
        }
        navigationController.pushViewController(viewController, animated: false)
    }
    
    private func showWelcome() {
        let viewController = WelcomeViewController { [unowned self] in
            self.showWeekOverview()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showWeekOverview() {
        let viewController = WeekViewController(data: dataManager.data()) { [unowned self] day in
            self.showWeatherDay(day)
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showWeatherDay(_ day: WeatherDay) {
        let viewController = WeatherDayViewController(day: day)
        navigationController.pushViewController(viewController, animated: true)
    }
}
