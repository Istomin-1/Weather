//
//  ForecastWeather .swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import Foundation

struct ForecastWeather {
    
    let date: String
    
    let tempMin: Double
    var tempMinString: String {
        return String(format: "%.1f", tempMin)
    }
    let tempMax: Double
    var tempMaxString: String {
            return String(format: "%.1f", tempMax)
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
    init?(forecastWeatherData: ForecastWeatherData) {
        date = forecastWeatherData.date
        tempMin = forecastWeatherData.main.tempMin
        tempMax = forecastWeatherData.main.tempMax
        conditionCode = forecastWeatherData.weather.first!.id
        
    }
}
