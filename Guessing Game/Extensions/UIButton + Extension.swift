//
//  UIButton + Extension.swift
//  Guessing Game
//
//  Created by Konstantin on 22.05.2022.
//

import UIKit

extension UIButton {
    convenience init(text: String) {
        self.init(type: .system)
        self.backgroundColor = .blue
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
