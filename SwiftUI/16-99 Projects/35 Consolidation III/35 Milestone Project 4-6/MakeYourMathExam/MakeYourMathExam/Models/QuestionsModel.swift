//
//  QuestionsModel.swift
//  MakeYourMathExam
//
//  Created by Nicolas Florencio Felipe on 19/12/23.
//

import SwiftUI

struct QuestionsModel: View {
    
    @FocusState private var isFocused: Bool
    
    @State var question: ExamQuestions
    
    @State private var text = ""
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .center) {
                Text("\(question.x) X \(question.y)")
                    .font(.largeTitle)
                
                TextField("Your answer here.", text: $text)
                    .frame(width: 200)
                    .padding()
                    .background(.thickMaterial)
                    .clipShape(.capsule)
                    .keyboardType(.numberPad)
                    .focused($isFocused)
                    .autocorrectionDisabled()
                
            }
            .navigationTitle("\(question.userAnswer)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if isFocused {
                    Button(question.userAnswer == "" ? "Send" : "Edit") {
                        question.setUserAnswer(text)
                        text = ""
                        isFocused.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    QuestionsModel(question: ExamQuestions(difficulty: .hard))
}
