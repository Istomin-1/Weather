//
//  ForecastWeatherData.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import Foundation

struct ForecastWeatherData: Codable {
    let main: ForecastMain
    let date: String
    let weather: [WeatherCode]
    
    enum CodingKeys: String, CodingKey {
        case main
        case date = "dt_txt"
        case weather
    }
}
struct ForecastMain: Codable {
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
struct WeatherCode: Codable {
    let id: Int
}

