//
//  QuestionModel.swift
//  MathExam
//
//  Created by Nicolas Florencio Felipe on 12/12/23.
//

import SwiftUI

struct QuestionModel: View {

    @ObservedObject var sharedData = SharedData()
    @State var question: Question
    @State var isSend = false
    @State var isRight = false
    
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            
            if isSend {
                Rectangle()
                    .fill(isSend && self.question.getResult() == authOfInt(text) ? .green : .red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(0.8)
                    .zIndex(1000.0)
                
            }
            
            VStack {
                Text("\(question.getX()) X \(question.getY())")
                    .font(.largeTitle)
                TextField("Answer", text: $text)
                    .textFieldStyle()
                
                Button {
                    if question.getResult() == authOfInt(text) {
                        sharedData.score += 1
                    }
                    isSend.toggle()
                    
                } label: {
                    Text("Send")
                }
                .padding()
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .disabled(isSend)
        
        
    }
    
    func authOfInt (_ text: String) -> Int {
        return Int(text) ?? 0
    }
    
}

#Preview {
    QuestionModel(
        question: Question(x: 5, y: 5)
    )
}
