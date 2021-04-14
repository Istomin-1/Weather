//
//  ForecastWeather .swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import Foundation

struct ForecastWeather {
    
    let name: String
    
    let dates: [WeatherForecast]
    var dateFormater: [String] {
        var array = [String]()
        for date in dates {
            let one = date.dtTxt
            
            let dateStringGet = DateFormatter()
            dateStringGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let datePrint = DateFormatter()
            datePrint.dateFormat = "dd MMMM"
            guard let dateNew = dateStringGet.date(from: one) else { return [] }
            
            let two = datePrint.string(from: dateNew)
            array.append(two)
        }
        return array
    }
    
    
    let temp: Double
    var tempString: String {
        return String(format: "%.0f", temp)
    }
    
    let feelsLike: Double
    var feelsLikeString: String {
    return String(format: "%.0f °C", feelsLike)
}
    
    let tempMin: [WeatherForecast]
    var tempMinString: [String] {
        var array = [String]()
            for temp in tempMin {
                let one = temp.main.tempMin
                let two = String(format: "%.0f°C /", one)
                array.append(two)
            }
        return array
    }
    
    let tempMax: [WeatherForecast]
    var tempMaxString: [String] {
        var array = [String]()
            for temp in tempMax {
                let one = temp.main.tempMax
                let two = String(format: "%.0f°C ", one)
                array.append(two)
            }
        return array
    }
  
    let wind: Double
    var windString: String {
            return String(format: "%.0f m/s", wind)
    }
    
    let conditionCode: [WeatherForecast]
  
    var systemIcnNameString: [String] {
        var array = [String]()
        for temp in conditionCode {
        let one = temp.weather.first!.id
        switch one {
        case 200...232: array.append("cloud.bolt.rain.fill")
        case 300...321: array.append("cloud.drizzle.fill")
        case 500...531: array.append("cloud.rain.fill")
        case 600...622: array.append("cloud.snow.fill")
        case 701...781: array.append("cloud.fog.fill")
        case 800: array.append("sun.max.fill")
        case 801...804: array.append("cloud.fill")
        default: array.append("questionmark.circle.fill")
        }
            
        }
        return array
    }
    
    init?(forecastWeatherData: ForecastWeatherData) {
        name = forecastWeatherData.city.name
        dates = forecastWeatherData.list
        temp = forecastWeatherData.list.first!.main.temp
        feelsLike = forecastWeatherData.list.first!.main.feelsLike
        tempMin = forecastWeatherData.list
        tempMax = forecastWeatherData.list
        wind = forecastWeatherData.list.first!.wind.speed
        
        conditionCode = forecastWeatherData.list
    }
    
}
