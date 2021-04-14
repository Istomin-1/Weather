//
//  CitiesWeatherTableViewController.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import UIKit

class CitiesWeatherTableViewController: UITableViewController {
    
    var citiesWeather = [ForecastWeather]()
    var networkManager = NetworkWeatherManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
        loadListOfCities()
        }

    // MARK: - Table view data source
    
    private func loadListOfCities() {
        let startCities = ["Ekaterinburg", "Moscow"]
        if DataManager.cityName.isEmpty {
            for city in startCities {
                self.networkManager.fetchForecastWeather(forCity: city)
                DataManager.cityName.insert(city, at: DataManager.cityName.endIndex)
            }
        } else {
            for city in DataManager.cityName {
                self.networkManager.fetchForecastWeather(forCity: city)
            }
        }
    }
    
    func getWeather() {
        networkManager.onCompletion = { [weak self] forecastWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: forecastWeather)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return citiesWeather.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell

        let city = citiesWeather[indexPath.row]
        cell.cityName.text = city.name
        cell.cityTemp.text = city.tempString
        cell.cityImage.image = UIImage(systemName: city.systemIcnNameString[0])

        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            citiesWeather.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            DataManager.cityName.remove(at: indexPath.row)
        }
    }
   
    func updateInterfaceWith(weather: ForecastWeather) {
        DispatchQueue.main.async {
            
            let newIndexPath = IndexPath(row: self.citiesWeather.count, section: 0)
            self.citiesWeather.append(weather)
            self.tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    
    @IBAction func addCityPressed(_ sender: Any) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) {[unowned self] city in
            self.networkManager.fetchForecastWeather(forCity: city)
            DataManager.cityName.insert(city, at: DataManager.cityName.endIndex)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailWeather" {
        let detailCityWeatherViewController = segue.destination as! DetailCityWeatherViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let cityWeather = citiesWeather[indexPath.row]
            detailCityWeatherViewController.cityWeather = cityWeather
        
    }
}
}


extension CitiesWeatherTableViewController {
    
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField { textField in
            let cities = ["San Francisco", "Mockow", "New York", "Stambul", "Viena"]
            textField.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let searchTF = alert.textFields?.first
            guard let cityName = searchTF?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(search)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
