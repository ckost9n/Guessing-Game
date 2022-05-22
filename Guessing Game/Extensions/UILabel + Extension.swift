//
//  UILabel + Extension.swift
//  Guessing Game
//
//  Created by Konstantin on 22.05.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String) {
        self.init()
        
//        self.font = .robotoMedium14()
//        self.textColor = .specialLightBrown
        
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
