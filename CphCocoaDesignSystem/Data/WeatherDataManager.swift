//
//  WeatherData.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 03/12/2023.
//

import Foundation

/// A type representing information about weather on a specific day.
struct WeatherDay {
    let title: String
    let icon: IconAsset
    let intro: String
    let header: String
    let body: String
}

class WeatherDataManager {
    
    func data() -> [WeatherDay] {
        
        let info = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
        let header = "Ut enim ad minim"
        let body = "Et vix facer movet, est numquam expetenda voluptaria id. Vim no placerat singulis suscipiantur, pri quis mentitum sadipscing ex. Eros doming et mei. Vim ut sanctus senserit conceptam, mei ea congue feugait. Menandri definiebas mei ea. Unum nulla nemore cu qui, est at errem doming aliquip, vix an case patrioque."
        
        return [
            WeatherDay(title: "Monday", icon: .sun, intro: info, header: header, body: body),
            WeatherDay(title: "Tuesday", icon: .rain, intro: info, header: header, body: body),
            WeatherDay(title: "Wednesday", icon: .rain, intro: info, header: header, body: body),
            WeatherDay(title: "Thursday", icon: .sun, intro: info, header: header, body: body),
            WeatherDay(title: "Friday", icon: .snow, intro: info, header: header, body: body),
            WeatherDay(title: "Saturday", icon: .sun, intro: info, header: header, body: body),
            WeatherDay(title: "Sunday", icon: .sun, intro: info, header: header, body: body),
        ]
    }
}
