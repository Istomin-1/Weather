//
//  NetworkWeatherManager.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import Foundation

class NetworkWeatherManager {
    
    var onCompletion: ((ForecastWeather) -> Void)?
    
    func fetchForecastWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=metric"
        performRequest(withUrlString: urlString)
    }
    
    
    func performRequest(withUrlString urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let forecastWeather = self.parseJSON(withData: data) {
                        self.onCompletion?(forecastWeather)
                    }
                }
        }
        task.resume()
    }
    
    private func parseJSON(withData data: Data) -> ForecastWeather? {
        let decoder = JSONDecoder()
        do {
            let forecastWeatherData = try decoder.decode(ForecastWeatherData.self, from: data)
            guard let forecastWeather = ForecastWeather(forecastWeatherData: forecastWeatherData) else { return nil }
            return forecastWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
