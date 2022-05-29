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
    
    private let validator = Validator()
    private var storage = Storage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setupViews()
        setConstraints()
        textLabel.isHidden = true
        Storage.shared.computerNumber = Int.random(in: 0...100)
        textLabel.numberOfLines = 0
    }
    
    private func setDelegate() {
        textFieldNumber.delegate = self
    }
    
    private func setupViews() {
        buttonGuess.addTarget(self, action: #selector(buttonGuessTapped), for: .touchUpInside)
        buttonGuess.isEnabled = false
        buttonGuess.alpha = 0.5
        
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
        
        textFieldNumber.endEditing(true)
        
        textLabel.isHidden = false
        print(Storage.shared.computerNumber)
        print(Storage.shared.userNumer)
        
        if Storage.shared.computerNumber > Storage.shared.userNumer {
            textLabel.text =  "No, my number is bigger than you think"
            textFieldNumber.text = ""
            
        } else if Storage.shared.computerNumber < Storage.shared.userNumer{
            textLabel.text =  "No, my number is smaller than you think"
            textFieldNumber.text = ""
            
        } else {
            
            let alert = UIAlertController(title: "Congrats!", message: "You got it", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "See Results", style: .default) { _ in
                let scoreVC = ScoreViewController()
                scoreVC.modalPresentationStyle = .fullScreen
                scoreVC.modalTransitionStyle = .flipHorizontal
                self.present(scoreVC, animated: true)
            }
            
            alert.addAction(action)
            
            present(alert, animated: true)
            
            
           
        }
    }
}

// MARK: - UITextFieldDelegate

extension UserGuessViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return validator.hasNumbers(text: string)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text,
              let number = Int(text) else { return }
        buttonGuess.isEnabled = true
        buttonGuess.alpha = 1
        Storage.shared.userNumer = number
        print(Storage.shared.userNumer)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
   
    
    //    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    //        if textField.text != "" {
    //            return true
    //        } else {
    //            textField.placeholder = "Type the number"
    //            return false
    //        }
    //    }
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
