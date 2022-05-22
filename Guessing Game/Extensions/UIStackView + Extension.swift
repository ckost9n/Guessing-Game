//
//  UIStackView + Extension.swift
//  Guessing Game
//
//  Created by Konstantin on 22.05.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubViews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubViews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
