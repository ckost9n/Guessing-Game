//
//  Storage.swift
//  Guessing Game
//
//  Created by Konstantin on 23.05.2022.
//

import Foundation

struct Storage {
    
   
    
    var userNumer = 50
    var computerNumber = 50
    
    var userTry = 0
    var computerTry = 0
    
    var compNum = Int.random(in: 0...100)
    
    static var shared = Storage()
    
    var array = [Int](0...100)
    
    func generateRandomNumber(array:[Int]) -> Int {
        Int.random(in: 0...array.count)
    }
}
