//
//  UserGuessViewController.swift
//  Guessing Game
//
//  Created by Konstantin on 23.05.2022.
//

import UIKit

class UserGuessViewController: UIViewController {
    
    private let labelTry = UILabel(text: "Try №1")
    private let labelUser = UILabel(text: "You are guessing")
    
    private var stackViewLabel = UIStackView()
    private var staskViewGuess = UIStackView()
    
    private let textFieldNumber = UITextField(text: "Your try")
    private let buttonGuess = UIButton(text: "Guess")
    private let textLabel = UILabel(text: "No, my number is less than yours")

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        
    }
    
    private func setupViews() {
        buttonGuess.addTarget(self, action: #selector(buttonGuessTapped), for: .touchUpInside)
        
        view.backgroundColor = .white
        stackViewLabel = UIStackView(
            arrangedSubViews: [labelTry, labelUser],
            axis: .vertical,
            spacing: 20
        )
        view.addSubview(stackViewLabel)

        staskViewGuess = UIStackView(
            arrangedSubViews: [textFieldNumber, buttonGuess, textLabel],
            axis: .vertical,
            spacing: 30
        )
        view.addSubview(staskViewGuess)
    }
    
    @objc func buttonGuessTapped() {
        let scoreVC = ScoreViewController()
        scoreVC.modalPresentationStyle = .fullScreen
        scoreVC.modalTransitionStyle = .flipHorizontal
        present(scoreVC, animated: true)
    }

}

// MARK: - Set Constraints

extension UserGuessViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            staskViewGuess.topAnchor.constraint(equalTo: stackViewLabel.bottomAnchor, constant: 60),
            staskViewGuess.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

       
    }
}
