//
//  CitiesWeatherTableViewController.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import UIKit


class CitiesWeatherTableViewController: UITableViewController {
    
    // MARK: - Properties
    var citiesWeather = [ForecastWeather]()
    var networkManager = NetworkWeatherManager()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
        loadListOfCities()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return citiesWeather.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
        
        let city = citiesWeather[indexPath.row]
        cell.cityName.text = city.name
        cell.cityTemp.text = city.tempString
        cell.cityImage.image = UIImage(systemName: city.systemIcnNameString.first!)
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            citiesWeather.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            DataManager.cityName.remove(at: indexPath.row)
        }
    }
    
    // MARK: - Updating and loading data
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
    
    private func getWeather() {
        networkManager.onCompletion = { [weak self] forecastWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: forecastWeather)
        }
    }
    
    private func updateInterfaceWith(weather: ForecastWeather) {
        DispatchQueue.main.async {
            let newIndexPath = IndexPath(row: self.citiesWeather.count, section: 0)
            self.citiesWeather.append(weather)
            self.tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    @IBAction func addCityPressed(_ sender: Any) {
        self.presentSearchAlertController(withTitle: "Enter city name",
                                          message: nil,
                                          style: .alert)
        {[unowned self] city in
            self.networkManager.fetchForecastWeather(forCity: city)
            DataManager.cityName.insert(city, at: DataManager.cityName.endIndex)
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailWeather" {
            let detailCityWeatherViewController = segue.destination as! DetailCityWeatherViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let cityWeather = citiesWeather[indexPath.row]
            detailCityWeatherViewController.cityWeather = cityWeather
        }
    }
}


