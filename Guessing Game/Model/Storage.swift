//
//  Storage.swift
//  Guessing Game
//
//  Created by Konstantin on 23.05.2022.
//

import Foundation
import UIKit

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
      
    mutating func CcomputerGuessNumber(_ array: [Int], target:  Int) -> Int{
        
        var middleIndex = (start + end) / 2
        
        if middleIndex > target {
            self.end = middleIndex - 1
            arrayOfNumbers = [Int](start...end)
            return middleIndex
            
        } else if middleIndex < target  {
            self.start = middleIndex + 1
            arrayOfNumbers = [Int](start...end)
            return middleIndex
        } else {
            return middleIndex
        }
    }
      
    func compareResult(label: UILabel) {
        
        if computerTry > userTry {
            label.text = "You Win"
        } else if computerTry < userTry {
            label.text = "Computer Win"
        } else {
            label.text = "It's Draw"
        }
    }
}
