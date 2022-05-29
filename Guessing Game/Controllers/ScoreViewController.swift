//
//  ScoreViewController.swift
//  Guessing Game
//
//  Created by Konstantin on 23.05.2022.
//

import UIKit

class ScoreViewController: UIViewController {
    
    private let scoreLabel = UILabel(text: "Scores: ")
    private let userScoreLabel = UILabel(text: "You's tries count: 6")
    private let computerScoreLabel = UILabel(text: "Computer's tries count: 8")
    private let winLabel = UILabel(text: "You Win")
    
    private var stackViewScore = UIStackView()
    private let button = UIButton(text: "Main menu")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        userScoreLabel.text = "Yours tries count: \(Storage.shared.userTry - 1 )"
        computerScoreLabel.text = "Computer's tries count: \(Storage.shared.computerTry - 1)"
        Storage.shared.compareResult(label: winLabel)
        
    }
    
    private func setupViews() {
        userScoreLabel.textAlignment = .left
        computerScoreLabel.textAlignment = .left
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.backgroundColor = .white
        view.addSubview(scoreLabel)
        stackViewScore = UIStackView(
            arrangedSubViews: [userScoreLabel, computerScoreLabel],
            axis: .vertical,
            spacing: 15
        )
        view.addSubview(stackViewScore)
        view.addSubview(winLabel)
        view.addSubview(button)
    }
    
    @objc func buttonTapped() {
        
        let mainVC = MainViewController()
        mainVC.modalTransitionStyle = .partialCurl
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
        Storage.shared.userTry = 1
        Storage.shared.computerTry = 1
    }
    
}


// MARK: - Set Constraints

extension ScoreViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            stackViewScore.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 60),
            stackViewScore.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackViewScore.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            winLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -50),
            winLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}
