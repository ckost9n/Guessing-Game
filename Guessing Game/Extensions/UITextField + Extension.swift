//
//  UITextField + Extension.swift
//  Guessing Game
//
//  Created by Konstantin on 23.05.2022.
//

import UIKit

extension UITextField {
    
    convenience init(text: String) {
        self.init()
        self.borderStyle = .roundedRect
//        self.textColor = .specialGray
//        self.font = .robotoBold20()
        self.placeholder = text
        self.textAlignment = .center
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.keyboardType = .phonePad
        self.clearButtonMode = .whileEditing
        self.returnKeyType = .done
        self.becomeFirstResponder()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
