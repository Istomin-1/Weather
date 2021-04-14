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
    @IBOutlet weak var currentWeatherImageView: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var dateOneDayLabel: UILabel!
    @IBOutlet weak var weatherForecastOneDayView: UIImageView!
    @IBOutlet weak var minTempOneDayLabel: UILabel!
    @IBOutlet weak var maxTempOneDayLabel: UILabel!
    
    @IBOutlet weak var dateTwoDaysLabel: UILabel!
    @IBOutlet weak var weatherForecastTwoDaysView: UIImageView!
    @IBOutlet weak var minTempTwoDaysLabel: UILabel!
    @IBOutlet weak var maxTempTwoDaysLabel: UILabel!
    
    @IBOutlet weak var dateThreeDaysLabel: UILabel!
    @IBOutlet weak var weatherForecastThreeDaysView: UIImageView!
    @IBOutlet weak var minTempThreeDaysLabel: UILabel!
    @IBOutlet weak var maxTempThreeDaysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatUI()
        view.addGradient()
    }

    func updatUI() {
        cityNameLabel.text = cityWeather.name
        currentWeatherImageView.image = UIImage(systemName: cityWeather.systemIcnNameString[0])
        temperature.text = cityWeather.tempString
        feelsLikeLabel.text = cityWeather.feelsLikeString
        windLabel.text = cityWeather.windString
        
        dateOneDayLabel.text = cityWeather.dateFormater[7]
        currentWeatherImageView.image = UIImage(systemName: cityWeather.systemIcnNameString[7])
        minTempOneDayLabel.text = cityWeather.tempMinString[7]
        maxTempOneDayLabel.text = cityWeather.tempMaxString[7]
        
        dateTwoDaysLabel.text = cityWeather.dateFormater[15]
        weatherForecastTwoDaysView.image = UIImage(systemName: cityWeather.systemIcnNameString[15])
        minTempTwoDaysLabel.text = cityWeather.tempMinString[15]
        maxTempTwoDaysLabel.text = cityWeather.tempMaxString[15]
        
        dateThreeDaysLabel.text = cityWeather.dateFormater[23]
        weatherForecastThreeDaysView.image = UIImage(systemName: cityWeather.systemIcnNameString[23])
        minTempThreeDaysLabel.text = cityWeather.tempMinString[23]
        maxTempThreeDaysLabel.text = cityWeather.tempMaxString[23]
    }
}

