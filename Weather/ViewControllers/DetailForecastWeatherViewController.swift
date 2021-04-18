//
//  DetailForecastWeatherViewController.swift
//  Weather
//
//  Created by Mikhail on 17.04.2021.
//

import UIKit

class DetailForecastWeatherViewController: UIViewController {
    
    var forecastWeather: ForecastWeatherForCollection!
    private let numberOfTimesOfDay = 8
    
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var feelsTextLabel: UILabel!
    @IBOutlet weak var windTextLabel: UILabel!
    @IBOutlet weak var forecastTextLabel: UILabel!
    
    
    @IBOutlet weak var forecastWeatherCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateinterface()
        forecastWeatherCollectionView.delegate = self
        forecastWeatherCollectionView.dataSource = self
        updateLayer()
    }
    
    func updateinterface() {
        nameCityLabel.text = forecastWeather.name
        currentWeatherImage.image = UIImage(systemName: forecastWeather.systemIcnNameString.first!)
        currentTempLabel.text = forecastWeather.tempString
        feelsLikeLabel.text = forecastWeather.feelsLikeString
        windLabel.text = forecastWeather.windString
    }
    func updateLayer() {
        currentWeatherImage.addShadow()
        nameCityLabel.addShadow()
        currentTempLabel.addShadow()
        feelsLikeLabel.addShadow()
        windLabel.addShadow()
       
        celsiusLabel.addShadow()
        feelsTextLabel.addShadow()
        windTextLabel.addShadow()
        forecastTextLabel.addShadow()
    }
}




extension DetailForecastWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath)
    -> UICollectionReusableView {
        
        let dateForecast = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "dateCell", for: indexPath) as! DateForecastCollectionReusableView
        
        let weatherDate = forecastWeather.dateFormater[indexPath.section * numberOfTimesOfDay]
            
        dateForecast.dateForecastLabel.text = weatherDate
    
        return dateForecast
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return forecastWeather.dateFormater.count / numberOfTimesOfDay
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forecastCell", for: indexPath) as! ForecastCollectionViewCell
        
        cell.cityForecastWeather = forecastWeather
        cell.numberOfSection = indexPath.section
        
        return cell
    }

}

extension DetailForecastWeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 105)
    }
  
}
