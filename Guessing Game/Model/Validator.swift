//
//  Validator.swift
//  Guessing Game
//
//  Created by Konstantin on 23.05.2022.
//

import Foundation

struct Validator {
    let numbres = "1234567890"
    
    func hasNumbers(text: String) -> Bool {
        for number in numbres {
            if text.contains(number) { return true }
        }
        return false
    }
}
