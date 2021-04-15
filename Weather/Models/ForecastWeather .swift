//
//  ForecastWeather .swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import Foundation

struct ForecastWeather {
    
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
    private var tempMinDoubleAllDays: [[Double]] {
        var tempsMinDouble = [Double]()
        for temp in tempMin {
            let tempMinResponse = temp.main.tempMin
            tempsMinDouble.append(tempMinResponse)
        }
        let tempMinOneDay = createNewArray(array: tempsMinDouble, fromWhichIndex: 0, byWhatIndex: 7)
        let tempMinTwoDays = createNewArray(array: tempsMinDouble, fromWhichIndex: 7, byWhatIndex: 15)
        let tempMinThreeDays = createNewArray(array: tempsMinDouble, fromWhichIndex: 15, byWhatIndex: 23)
        
        return [tempMinOneDay, tempMinTwoDays, tempMinThreeDays]
    }
    var tempMinString: [[String]] {
        createStringFromDouble(from: tempMinDoubleAllDays)
    }
    
    let tempMax: [WeatherForecast]
    private var tempMaxDoubleAllDays: [[Double]] {
        var tempMaxDouble = [Double]()
        for temp in tempMax {
            let tempMaxResponse = temp.main.tempMax
            tempMaxDouble.append(tempMaxResponse)
        }
        let tempMaxOneDay = createNewArray(array: tempMaxDouble, fromWhichIndex: 0, byWhatIndex: 7)
        let tempMaxTwoDays = createNewArray(array: tempMaxDouble, fromWhichIndex: 7, byWhatIndex: 15)
        let tempMaxThreeDays = createNewArray(array: tempMaxDouble, fromWhichIndex: 15, byWhatIndex: 23)
        
        return [tempMaxOneDay, tempMaxTwoDays, tempMaxThreeDays]
    }
    
    var tempMaxString: [[String]] {
        createStringFromDouble(from: tempMaxDoubleAllDays)
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
    }
}
// MARK: - Helper functions for converting minimum and maximum temperature
private func createNewArray(array: [Double], fromWhichIndex indexOne: Int, byWhatIndex indextwo: Int) -> [Double] {
    var tempsMinDouble = [Double]()
    for index in indexOne ..< indextwo {
        tempsMinDouble.append(array[index])
    }
    return tempsMinDouble.sorted()
}

private func createStringFromDouble(from array: [[Double]]) -> [[String]] {
    var tempStringAllDays = [[String]]()
    for tempDoubleOneDay in array {
        var tempStringOneDay = [String]()
        for tempDouble in tempDoubleOneDay {
            let tempString = String(format: "%.0f°C ", tempDouble)
            tempStringOneDay.append(tempString)
        }
        tempStringAllDays.append(tempStringOneDay)
    }
    return tempStringAllDays
}
