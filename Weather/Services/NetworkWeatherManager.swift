//
//  NetworkWeatherManager.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import Foundation

class NetworkWeatherManager {
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    var urlString = "https://api.openweathermap.org/data/2.5/weather?q=london&appid=d3bade5172c920c5bca756844261b789"
    
    func performRequest(withUrlString urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let currentWeather = self.parseJSON(withData: data) {
                        self.onCompletion?(currentWeather)
                       
                    }
                }
        }
        task.resume()
    }
    
    private func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
