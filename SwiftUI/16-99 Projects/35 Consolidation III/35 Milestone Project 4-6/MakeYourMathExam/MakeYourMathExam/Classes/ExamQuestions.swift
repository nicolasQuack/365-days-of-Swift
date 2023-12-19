//
//  Questions.swift
//  MakeYourMathExam
//
//  Created by Nicolas Florencio Felipe on 18/12/23.
//

import Foundation
import Observation

@Observable
class ExamQuestions: Identifiable, Equatable {
    
    static func == (lhs: ExamQuestions, rhs: ExamQuestions) -> Bool {
        return true
    }
    
    var id = UUID()
    var difficulty: Difficulty
    var multipliers: Array<Int> {
        switch difficulty {
        case .easy:
            [2, 3, 4, 5]
        case .moderate:
            [6, 7, 8, 9]
        case .hard:
            [10, 11, 12, 13]
        }
    }
    var x: Int = 0
    var y: Int = 0
    var answer: Int {
        x*y
    }
    var userAnswer = String()
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        
        x = multipliers.shuffled()[0]
        y = Array(2...multipliers.last!).shuffled()[0]
    
    }
    
    func setUserAnswer (_ str: String) {
        self.userAnswer = str
    }
    
}
