//
//  ContentView.swift
//  Educational
//
//  Created by Nicolas Florencio Felipe on 06/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var difficultyLevelLabel: Array<String> = ["Easy", "Moderate", "Hard"]
    @State private var difficultyLevel: Array<Difficulty> = [.easy, .moderate, .hard]
    @State private var rangeOfQuestions: Array<Int> = [5, 10, 15]
    
    @State private var currentDifficulty: Difficulty = .moderate
    
    var body: some View {
        VStack {
            Text("Select difficulty:")
                .font(.largeTitle)
                .fontWeight(.light)
                .shadow(radius: 20)
                .padding(.vertical)

            HStack (spacing: 20) {
                ForEach(0..<difficultyLevelLabel.count, id: \.self) { num in
                    Button () {
                        currentDifficulty = difficultyLevel[num]
                        print(currentDifficulty)
                    } label: {
                        Rectangle()
                            .fill(num == 0 ? .green : num == 1 ? .yellow : .red)
                            .clipShape(.buttonBorder)
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                            .shadow(radius: 10)
                    }
                    .frame(width: 100, height: 100)
                    
                }
            }
            
            

            
        }
    }
}

#Preview {
    ContentView()
}
