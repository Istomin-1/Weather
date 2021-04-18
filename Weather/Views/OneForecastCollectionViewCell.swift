//
//  OneForecastCollectionViewCell.swift
//  Weather
//
//  Created by Mikhail on 17.04.2021.
//

import UIKit

class OneForecastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var forecastImage: UIImageView!
    @IBOutlet weak var minForecastLabel: UILabel!
    @IBOutlet weak var maxForecastLabel: UILabel!
    
    func updateLayer() {
        timeLabel.addShadow()
        forecastImage.addShadow()
        minForecastLabel.addShadow()
        maxForecastLabel.addShadow()
    }
}
