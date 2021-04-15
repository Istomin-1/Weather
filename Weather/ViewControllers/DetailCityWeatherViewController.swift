//
//  DetailCityWeatherViewController.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import UIKit

class DetailCityWeatherViewController: UIViewController {
    
    // MARK: - Properties
    var cityWeather: ForecastWeather!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentWeatherImageView: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    
    @IBOutlet weak var feelsLikeNameLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var windNameLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var forecastLabel: UILabel!
    
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

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateinterface()
        view.addGradient()
        updateLayer()
    }
    
    // MARK: - Update interface
    func updateinterface() {
        cityNameLabel.text = cityWeather.name
        currentWeatherImageView.image = UIImage(systemName: cityWeather.systemIcnNameString.first!)
        temperature.text = cityWeather.tempString
        feelsLikeLabel.text = cityWeather.feelsLikeString
        windLabel.text = cityWeather.windString
        
        dateOneDayLabel.text = cityWeather.dateFormater[7]
        weatherForecastOneDayView.image = UIImage(systemName: cityWeather.systemIcnNameString[7])
        minTempOneDayLabel.text = cityWeather.tempMinString.first!.first
        maxTempOneDayLabel.text = cityWeather.tempMaxString.first!.last
        
        dateTwoDaysLabel.text = cityWeather.dateFormater[15]
        weatherForecastTwoDaysView.image = UIImage(systemName: cityWeather.systemIcnNameString[15])
        minTempTwoDaysLabel.text = cityWeather.tempMinString[1].first
        maxTempTwoDaysLabel.text = cityWeather.tempMaxString[1].last
        
        dateThreeDaysLabel.text = cityWeather.dateFormater.last
        weatherForecastThreeDaysView.image = UIImage(systemName: cityWeather.systemIcnNameString.last!)
        minTempThreeDaysLabel.text = cityWeather.tempMinString.last!.first
        maxTempThreeDaysLabel.text = cityWeather.tempMaxString.last!.last
    }
    
    func updateLayer() {
        cityNameLabel.addShadow()
        currentWeatherImageView.addShadow()
        temperature.addShadow()
        celsiusLabel.addShadow()
        
        feelsLikeNameLabel.addShadow()
        feelsLikeLabel.addShadow()
        windNameLabel.addShadow()
        windLabel.addShadow()
        forecastLabel.addShadow()
        
        dateOneDayLabel.addShadow()
        minTempOneDayLabel.addShadow()
        maxTempOneDayLabel.addShadow()
        weatherForecastOneDayView.addShadow()
        
        dateTwoDaysLabel.addShadow()
        maxTempTwoDaysLabel.addShadow()
        minTempTwoDaysLabel.addShadow()
        weatherForecastTwoDaysView.addShadow()
        
        dateThreeDaysLabel.addShadow()
        maxTempThreeDaysLabel.addShadow()
        minTempThreeDaysLabel.addShadow()
        weatherForecastThreeDaysView.addShadow()
    }
}

