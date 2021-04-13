//
//  CityTableViewCell.swift
//  Weather
//
//  Created by Mikhail on 12.04.2021.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel! {
        didSet {
            cityName.adjustsFontSizeToFitWidth = true
            cityName.minimumScaleFactor = 0.5
        }
    }
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
