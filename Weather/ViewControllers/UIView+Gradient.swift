//
//  UIView+Gradient.swift
//  Weather
//
//  Created by Mikhail on 14.04.2021.
//

import UIKit

extension UIView {
    //MARK: - AddGradient
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0.6260589361, blue: 0.9956955314, alpha: 1).cgColor, #colorLiteral(red: 0.3276142776, green: 0.2321726382, blue: 0.7040293813, alpha: 1).cgColor]
        gradientLayer.locations = [0, 0.7]
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    }
    func updateUI() {
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 10
    }
}
