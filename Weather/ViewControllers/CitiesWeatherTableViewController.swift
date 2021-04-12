//
//  CitiesWeatherTableViewController.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import UIKit

class CitiesWeatherTableViewController: UITableViewController {
    
    var citiesWeather = [CurrentWeather]()
    var networkManager = NetworkWeatherManager()
    var urlString = "https://api.openweathermap.org/data/2.5/weather?q=Sankt-Peterburg&appid=d3bade5172c920c5bca756844261b789"

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.performRequest(withUrlString: urlString)
        getWeather()
    }
            

    // MARK: - Table view data source

    func getWeather() {
        networkManager.onCompletion = { [weak self] currentWeather in
        guard let self = self else { return }
        self.updateInterfaceWith(weather: currentWeather)
    }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return citiesWeather.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell

        let city = citiesWeather[indexPath.row]
        cell.cityName.text = city.cityName
        cell.cityTemp.text = city.temperatureString
        cell.cityImage.image = UIImage(systemName: "sun.max.fill")

        return cell
    }
   
    func updateInterfaceWith(weather: CurrentWeather) {
        citiesWeather = [weather]
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
