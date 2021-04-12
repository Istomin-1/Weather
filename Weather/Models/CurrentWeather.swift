//
//  CurrentWeather.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    let tempMin: Double
    var tempMinString: String {
        return String(format: "%.1f", tempMin)
    }
    let tempMax: Double
    var tempMaxString: String {
        return String(format: "%.1f", tempMax)
    }
    let wind: Double
    var windString: String {
        return String(format: "%.1f", wind)
    }
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return String(format: "%.1f", feelsLikeTemperature)
    }
    let conditionCode: Int
    var systemIcnNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return
            "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return
            "cloud.fog.fill"
        case 800: return "sun.max.fill"
        case 801...804: return "cloud.fill"
        default:
            return "questionmark.circle.fill"
        }
    }
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        tempMin = currentWeatherData.main.tempMin
        tempMax = currentWeatherData.main.tempMax
        wind = currentWeatherData.wind.speed
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
