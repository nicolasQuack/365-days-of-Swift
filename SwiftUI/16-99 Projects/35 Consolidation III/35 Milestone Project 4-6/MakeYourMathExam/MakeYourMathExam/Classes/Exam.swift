//
//  Math.swift
//  MakeYourMathExam
//
//  Created by Nicolas Florencio Felipe on 18/12/23.
//

import Foundation
import Observation

@Observable
class Exam {
    var questions = [ExamQuestions]()
    
    func generateQuestions (_ num: Int, _ difficulty: Difficulty) {
        
        for _ in 0..<num {
            questions.append(ExamQuestions(difficulty: difficulty))
        }
    }
    
}
