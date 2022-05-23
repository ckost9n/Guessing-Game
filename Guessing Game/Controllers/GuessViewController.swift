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
    private var storage = Storage.initial

    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegate()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.backgroundColor = .white
        view.addSubview(textFieldNumber)
        view.addSubview(button)
    }
    
    private func setDelegate() {
        textFieldNumber.delegate = self
    }
    
    @objc func buttonTapped() {
        print(#function)
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
        storage.userNumer = number
        print(storage.userNumer)
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
