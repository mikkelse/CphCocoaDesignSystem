//
//  WeatherDayViewController.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 03/12/2023.
//

import UIKit

class WeatherDayViewController: ScrollingContentViewController {
    
    init(day: WeatherDay) {
        
        let content = Content {
            Section {
                Icon(day.icon)
            }
            Section {
                Text(.title, day.title)
                Text(.body, day.intro)
                Text(.header, day.header)
                Text(.body, day.body)
            }
        }
    
        super.init(topContent: content)
    }
}
