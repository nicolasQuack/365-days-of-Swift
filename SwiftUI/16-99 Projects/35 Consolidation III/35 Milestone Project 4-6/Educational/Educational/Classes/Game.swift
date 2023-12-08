//
//  Game.swift
//  Educational
//
//  Created by Nicolas Florencio Felipe on 08/12/23.
//

import Foundation

class Game {
    var multipliers: Array<Int>
    var numOfQuestions: Int
    
    init(multipliers: Array<Int>, numOfQuestions: Int) {
        self.multipliers = multipliers
        self.numOfQuestions = numOfQuestions
    }
}
