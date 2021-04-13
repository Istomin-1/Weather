//
//  ForecastWeather .swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import Foundation

struct ForecastWeather {
    
    let name: String
    let date: String
    
    let temp: Double
    var tempString: String {
        return String(format: "%.0f", temp)
    }
    
    let feelsLike: Double
    var feelsLikeString: String {
    return String(format: "%.0f °C", feelsLike)
}
    
    let tempMin: Double
    var tempMinString: String {
        return String(format: "%.0f°C /", tempMin)
    }
    let tempMax: Double
    var tempMaxString: String {
            return String(format: "%.0f°C", tempMax)
    }
    
    let wind: Double
    var windString: String {
            return String(format: "%.0f m/s", wind)
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
        name = forecastWeatherData.city.name
        date = forecastWeatherData.list.first!.dtTxt
        temp = forecastWeatherData.list.first!.main.temp
        feelsLike = forecastWeatherData.list.first!.main.feelsLike
        tempMin = forecastWeatherData.list.first!.main.tempMin
        tempMax = forecastWeatherData.list.first!.main.tempMax
        wind = forecastWeatherData.list.first!.wind.speed
        
        conditionCode = forecastWeatherData.list.first!.weather.first!.id
        
    }
}
