//
//  QuestionsView.swift
//  Educational
//
//  Created by Nicolas Florencio Felipe on 08/12/23.
//

import SwiftUI

struct QuestionsView: View {
    @State public var gameObject: Game
    
    var body: some View {
        VStack {
            List {
                ForEach (0..<gameObject.numOfQuestions, id: \.self) { num in
                    Image(systemName: "\(num+1).circle")
                }
            }
        }
    }
    
    func generateQuestions () -> Int {
        let a: Int = gameObject.multipliers.randomElement() ?? 0
        let b: Int = gameObject.multipliers.randomElement() ?? 0
        return a*b
    }
}

#Preview {
    QuestionsView(
        gameObject: Game(multipliers: [1, 2, 3, 4, 5], numOfQuestions: 5)
    )
}
