//
//  Storage.swift
//  Guessing Game
//
//  Created by Konstantin on 23.05.2022.
//

import Foundation

struct Storage {
    
    var start = 0
    var end = 100
    
    var userNumer = 50
    var computerNumber = 50
    var userTry = 0
    var computerTry = 0
    
    static var shared = Storage()
    
    var arrayOfNumbers = [Int](0...100)
    
    mutating func generateRandomNumber() -> Int {
        guard let number = arrayOfNumbers.randomElement() else {
            return 0
        }
        return number
    }
      
    mutating func generateArray(_ number: Int) -> [Int]{
        
        if number > userNumer {
            self.end = number - 1
            arrayOfNumbers = [Int](start...end)
            return arrayOfNumbers
        } else {
            self.start = number + 1
            arrayOfNumbers = [Int](start...end)
            return arrayOfNumbers
        }
    }
      
}
