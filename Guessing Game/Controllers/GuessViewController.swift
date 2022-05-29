//
//  GuessViewController.swift
//  Guessing Game
//
//  Created by Konstantin on 23.05.2022.
//

import UIKit

class GuessViewController: UIViewController {
    
    private let textFieldNumber = UITextField(text: "Guess the number")
    
    private let button = UIButton(text: "Enter the Number")
    
    private let validator = Validator()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegate()
        setupViews()
        setConstraints()
        
    }
    
    private func setupViews() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.isEnabled = false
        button.alpha = 0.5

        view.backgroundColor = .white
        view.addSubview(textFieldNumber)
        view.addSubview(button)
    }
    
    private func setDelegate() {
        textFieldNumber.delegate = self
    }
    
    @objc func buttonTapped() {
        let computerGuessVC = ComputerGuessViewController()
        computerGuessVC.modalPresentationStyle = .fullScreen
        computerGuessVC.modalTransitionStyle = .crossDissolve
        present(computerGuessVC, animated: true)
    }
    
}

// MARK: - UITextFieldDelegate

extension GuessViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return validator.hasNumbers(text: string)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text,
              let number = Int(text) else { return }
        button.isEnabled = true
        button.alpha = 1
        
        Storage.shared.userNumer = number
        print(Storage.shared.userNumer)
        
        if number < 0 || number > 100{
            let alert = UIAlertController(title: "OOPS!", message: "The number must be from 0 to 100", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true)
            button.isEnabled = false
            button.alpha = 0.5
        }
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - Set Constraints

extension GuessViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            textFieldNumber.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            textFieldNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
