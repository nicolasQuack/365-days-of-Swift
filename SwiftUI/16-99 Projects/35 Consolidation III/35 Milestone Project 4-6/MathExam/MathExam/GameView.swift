//
//  GameView.swift
//  MathExam
//
//  Created by Nicolas Florencio Felipe on 12/12/23.
//

import SwiftUI

struct GameView: View {
    
    var arrayOfQuestions: Array<Question>
    
    var body: some View {
        ScrollView {
            ForEach(arrayOfQuestions, id: \.id) { question in
                QuestionModel(question: question)
            }
        }
    }
}

#Preview {
    GameView(arrayOfQuestions: [
        Question(x: 5, y: 5),
        Question(x: 5, y: 5),
        Question(x: 5, y: 5),
        Question(x: 5, y: 5),
        Question(x: 5, y: 5)
    ])
}
