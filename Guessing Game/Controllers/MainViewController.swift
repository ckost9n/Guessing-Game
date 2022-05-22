//
//  MainViewController.swift
//  Guessing Game
//
//  Created by Konstantin on 22.05.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let label = UILabel(text: "My Awesome Game")

    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(label)
    }

}

// MARK: - Set Constraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
