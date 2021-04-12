//
//  CurrentWeatherData.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let wind: Wind
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
struct Wind: Codable {
    let speed: Double
}

struct Weather: Codable {
    let id: Int
}

