//
//  MainViewController.swift
//  Guessing Game
//
//  Created by Konstantin on 22.05.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let label = UILabel(text: "My Awesome Game")
    
    private let button = UIButton(text: "Start New Game")
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    private func setupViews() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)
    }
    
    @objc func buttonTapped() {
        let guessVC = GuessViewController()
        guessVC.modalPresentationStyle = .fullScreen
        guessVC.modalTransitionStyle = .coverVertical
        present(guessVC, animated: true)
    }

}

// MARK: - Set Constraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
