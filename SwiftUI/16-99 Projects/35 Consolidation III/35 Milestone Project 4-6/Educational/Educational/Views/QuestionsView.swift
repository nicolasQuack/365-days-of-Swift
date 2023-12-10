//
//  QuestionsView.swift
//  Educational
//
//  Created by Nicolas Florencio Felipe on 08/12/23.
//

import SwiftUI

struct QuestionsView: View {
    @State public var gameObject: Game
    
    @State private var a: Int = 0
    @State private var b: Int = 0
    
    var body: some View {
        ForEach(0..<gameObject.numOfQuestions, id: \.self) { num in
            generateQuestion(obj: gameObject)
        }
    }
    
    func generateQuestion(obj: Game) -> some View {
        let shuffleArr = gameObject.multipliers.shuffled()
        let firstPart = Array(2...gameObject.multipliers.last!).shuffled()[0]
        let secondPart = shuffleArr[0]
        @State var field = ""
        let answer = firstPart*secondPart
        var isSend = false
        
        return VStack {
            HStack {
                Text(" \(firstPart) X  \(secondPart)")
                    .padding()
                
                TextField("answer here", text: $field)
                    .disabled(isSend)
                    .opacity(isSend ? 0.3 : 1)
                
                Button ("Send") {
                    isSend.toggle()
                }
                .disabled(isSend)
                .padding()
            }
        }

    }
}

#Preview {
    QuestionsView(
        gameObject: Game(multipliers: [9, 11, 12, 13, 14, 15], numOfQuestions: 10)
    )
}
