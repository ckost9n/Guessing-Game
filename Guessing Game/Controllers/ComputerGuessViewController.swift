//
//  ComputerGuessViewController.swift
//  Guessing Game
//
//  Created by Konstantin on 23.05.2022.
//

import UIKit

class ComputerGuessViewController: UIViewController {
    
    //var array = Storage.shared.array
    
    var random = Storage.shared.generateRandomNumber(array: Storage.shared.array )
    
    private let labelTry = UILabel(text: "Try №1")
    private let labelComputer = UILabel(text: "Computer is guessing")
    private let labelNumber = UILabel(text: "You number is - 80 ?")
    private let labelText = UILabel(text: "My number is ...")
    
    private var stackViewLabel = UIStackView()
    private var stackViewButton = UIStackView()
    
    private let buttonMore = UIButton(symbol: ">")
    private let buttonEquals = UIButton(symbol: "=")
    private let buttonLess = UIButton(symbol: "<")
    
    private let buttonSegue = UIButton(text: "Go to the next VC")
    
    var storage = Storage.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        
        labelNumber.text = "Your number is - \(random)?"
        print(random)
        
    }
    
    
    
    private func setupViews() {
        buttonMore.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        buttonEquals.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        buttonLess.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        buttonSegue.addTarget(self, action: #selector(buttonSegueTapped), for: .touchUpInside)
        
        view.backgroundColor = .white
        stackViewLabel = UIStackView(
            arrangedSubViews: [labelTry, labelComputer],
            axis: .vertical,
            spacing: 20
        )
        view.addSubview(stackViewLabel)
        view.addSubview(labelNumber)
        view.addSubview(labelText)
        stackViewButton = UIStackView(
            arrangedSubViews: [buttonMore, buttonEquals, buttonLess],
            axis: .horizontal,
            spacing: 10
        )
        view.addSubview(stackViewButton)
        view.addSubview(buttonSegue)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        
        switch sender {
            
        case buttonMore:  print("Button Equals Tapped")
        case buttonEquals:
            print("Button Equals Tapped")
            buttonSegueTapped()
        case buttonLess:
            print("Button Less Tapped")
        default: break
        }
        
    }
    
    @objc func buttonSegueTapped() {
        let userGuessVC = UserGuessViewController()
        userGuessVC.modalPresentationStyle = .fullScreen
        userGuessVC.modalTransitionStyle = .flipHorizontal
        present(userGuessVC, animated: true)
    }
    
}

// MARK: - Set Constraints

extension ComputerGuessViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelNumber.topAnchor.constraint(equalTo: stackViewLabel.bottomAnchor, constant: 60),
            labelNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackViewButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            stackViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelText.bottomAnchor.constraint(equalTo: stackViewButton.topAnchor, constant: -10),
            labelText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonSegue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSegue.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


