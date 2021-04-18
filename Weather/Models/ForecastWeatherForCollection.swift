//
//  ForecastWeatherForCollection.swift
//  Weather
//
//  Created by Mikhail on 18.04.2021.
//

import Foundation

struct ForecastWeatherForCollection {
    
    //MARK: - Transformed model
    let name: String
    
    let temp: Double
    var tempString: String {
        return String(format: "%.0f", temp)
    }
    
    let feelsLike: Double
    var feelsLikeString: String {
        return String(format: "%.0f °C", feelsLike)
    }
    
    let wind: Double
    var windString: String {
        return String(format: "%.0f m/s", wind)
    }
    
    let tempMin: [WeatherForecast]
    private var tempMinDoubleAllDays: [Double] {
        var tempsMinDouble = [Double]()
        for temp in tempMin {
            let tempMinResponse = temp.main.tempMin
            tempsMinDouble.append(tempMinResponse)
        }
        return tempsMinDouble
    }
    var tempMinString: [String] {
        var tempStringOneDay = [String]()
        for tempDouble in tempMinDoubleAllDays {
            let tempString = String(format: "%.0f°C ", tempDouble)
            tempStringOneDay.append(tempString)
        }
        return tempStringOneDay
    }
    
    let tempMax: [WeatherForecast]
    private var tempMaxDoubleAllDays: [Double] {
        var tempsMaxDouble = [Double]()
        for temp in tempMax {
            let tempMaxResponse = temp.main.tempMax
            tempsMaxDouble.append(tempMaxResponse)
        }
        return tempsMaxDouble
    }
    var tempMaxString: [String] {
        var tempStringOneDay = [String]()
        for tempDouble in tempMaxDoubleAllDays {
            let tempString = String(format: "%.0f°C ", tempDouble)
            tempStringOneDay.append(tempString)
        }
        return tempStringOneDay
    }
    
    let dates: [WeatherForecast]
    var dateFormater: [String] {
        var datesString = [String]()
        for date in dates {
            let dateResponse = date.dtTxt
            
            let dateStringGet = DateFormatter()
            dateStringGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let datePrint = DateFormatter()
            datePrint.dateFormat = "dd MMMM"
            
            guard let dateNew = dateStringGet.date(from: dateResponse) else { return [] }
            let dateString = datePrint.string(from: dateNew)
            
            datesString.append(dateString)
        }
        return datesString
    }
    
    let times: [WeatherForecast]
    var dateFormaterTimes: [String] {
        var timesString = [String]()
        for time in times {
            let timeResponse = time.dtTxt
            
            let timeStringGet = DateFormatter()
            timeStringGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let timePrint = DateFormatter()
            timePrint.dateFormat = "HH:mm"
            
            guard let timeNew = timeStringGet.date(from: timeResponse) else { return [] }
            let timeString = timePrint.string(from: timeNew)
            
            timesString.append(timeString)
        }
        return timesString
    }
    
    let conditionCode: [WeatherForecast]
    var systemIcnNameString: [String] {
        var conditionCodes = [String]()
        for code in conditionCode {
            
            let codeResponse = code.weather.first!.id
            
            switch codeResponse {
            case 200...232: conditionCodes.append("cloud.bolt.rain.fill")
            case 300...321: conditionCodes.append("cloud.drizzle.fill")
            case 500...531: conditionCodes.append("cloud.rain.fill")
            case 600...622: conditionCodes.append("cloud.snow.fill")
            case 701...781: conditionCodes.append("cloud.fog.fill")
            case 800: conditionCodes.append("sun.max.fill")
            case 801...804: conditionCodes.append("cloud.fill")
            default: conditionCodes.append("questionmark.circle.fill")
            }
        }
        return conditionCodes
    }
    
    // MARK: - Initializer
    init?(forecastWeatherData: ForecastWeatherData) {
        name = forecastWeatherData.city.name
        dates = forecastWeatherData.list
        temp = forecastWeatherData.list.first!.main.temp
        feelsLike = forecastWeatherData.list.first!.main.feelsLike
        tempMin = forecastWeatherData.list
        tempMax = forecastWeatherData.list
        wind = forecastWeatherData.list.first!.wind.speed
        conditionCode = forecastWeatherData.list
        times = forecastWeatherData.list
    }
}


