//
//  ForecastCollectionViewCell.swift
//  Weather
//
//  Created by Mikhail on 17.04.2021.
//

import UIKit


class ForecastCollectionViewCell: UICollectionViewCell,
                                  UICollectionViewDelegate,
                                  UICollectionViewDataSource,
                                  UICollectionViewDelegateFlowLayout{
    
    // MARK: - Public Properties
    var numberOfSection: Int!
    var cityForecastWeather: ForecastWeatherForCollection!
    
    // MARK: - Private Properties
    private let numberOfTimesOfDay = 8
    
    // MARK: - IB Outlets
    @IBOutlet weak var collectionInCell: UICollectionView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionInCell.delegate = self
        collectionInCell.dataSource = self
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return numberOfTimesOfDay
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "oneForecastCell", for: indexPath) as! OneForecastCollectionViewCell
        
        let index = indexPath.item + numberOfTimesOfDay * numberOfSection
        
        cell.forecastImage.image = UIImage(systemName: cityForecastWeather.systemIcnNameString[index])
        cell.minForecastLabel.text = cityForecastWeather.tempMinString[index]
        cell.maxForecastLabel.text = cityForecastWeather.tempMaxString[index]
        cell.timeLabel.text = cityForecastWeather.dateFormaterTimes[index]
        
        cell.updateLayer()
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: -  UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
}

