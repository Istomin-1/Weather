//
//  DetailCityWeatherViewController.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import UIKit

class DetailCityWeatherViewController: UIViewController {
    
    var cityWeather: ForecastWeather!

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherForecastView: UIImageView!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatUI()
    }

    func updatUI() {
        cityNameLabel.text = cityWeather.name
        weatherImageView.image = UIImage(systemName: cityWeather.systemIcnNameString)
        temperature.text = cityWeather.tempString
        feelsLikeLabel.text = cityWeather.feelsLikeString
        windLabel.text = cityWeather.windString
        dateLabel.text = cityWeather.date
        weatherForecastView.image = UIImage(systemName: cityWeather.systemIcnNameString)
        minTempLabel.text = cityWeather.tempMinString
        maxTempLabel.text = cityWeather.tempMaxString
    }
}

