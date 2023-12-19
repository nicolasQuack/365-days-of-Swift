//
//  Exam.swift
//  MakeYourMathExam
//
//  Created by Nicolas Florencio Felipe on 18/12/23.
//

import SwiftUI

struct ExamView: View {
    
    @State var exam: Exam
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(exam.questions) { question in
                    NavigationLink ("\(question.x) X \(question.y) = \(question.userAnswer)") {
                        QuestionsModel(question: question)
                    }
                }
            }
            .navigationTitle("Exam: \(navTitleValidation())/\(exam.questions.count)")
            .navigationBarTitleDisplayMode(.inline)
          
            
            NavigationLink ("Hand Over") {
                TestResult(exam: exam)
            }
            .disabled(buttonValidation())
            .padding()
        }
        
    }
    
    func buttonValidation () -> Bool {
        var isResponse = [Bool]()
        
        for i in exam.questions {
            if i.userAnswer != "" {
                isResponse.append(true)
            } else {
                isResponse.append(false)
            }
        }
        if isResponse.contains(false) {
            return true
        } else {
            return false
        }
    }
    
    func navTitleValidation () -> Int {
        var count = 0
        
        for j in exam.questions {
            if j.userAnswer != "" {
                count += 1
            }
        }
        return count
    }
    
}

#Preview {
    ExamView(exam: Exam())
}
