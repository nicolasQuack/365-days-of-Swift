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
        List {
            ForEach(arrayOfQuestions, id: \.id) { question in
                QuestionModel(question: question)
                    .frame(maxHeight: .infinity, alignment: .center)
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
