//
//  ContentView.swift
//  Educational
//
//  Created by Nicolas Florencio Felipe on 06/12/23.
//

import SwiftUI

struct ContentView: View {
    
    // Easy : 2...4
    // Moderate: 5...8
    // Hard: 9...12
    
    @State private var difficultyLevelLabel: Array<String> = ["Easy", "Moderate", "Hard"]
    @State private var difficultyLevel: Array<Difficulty> = [.easy, .moderate, .hard]
    @State private var rangeOfQuestions: Array<Int> = [5, 10, 15]
    
    @State private var currentDifficulty: Difficulty = .moderate
    @State private var currentNumOfQuestions: Int = 10
    
    var body: some View {
        VStack {
            
            //Select difficulty
            VStack {
                Text("Select difficulty:")
                    .textStyle()

                HStack (spacing: 20) {
                    ForEach(0..<difficultyLevelLabel.count, id: \.self) { num in
                        Button () {
                            currentDifficulty = difficultyLevel[num]
                        } label: {
                            Rectangle()
                                .fill(num == 0 ? .green : num == 1 ? .yellow : .red)
                                .clipShape(.buttonBorder)
                                .font(.subheadline)
                                .foregroundStyle(.primary)
                                .shadow(radius: 10)
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
            .padding(.top, 100)
            
            //Number of Questions
            VStack {
                Text("Number of Questions:")
                    .textStyle()

                Picker("hello", selection: $currentNumOfQuestions) {
                    ForEach (rangeOfQuestions, id: \.self) {
                        Text(String($0))
                    }
                }
                .pickerStyle(.palette)
                .shadow(radius: 10)
                .frame(width: 340)
            }
            .padding(.top, 100)
            
            //Generate button
            VStack {
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(.thinMaterial)
                            .frame(width: 100, height: 50)
                            .clipShape(.buttonBorder)
                            .shadow(radius: 10)
                        Text("Generate")
                            .foregroundStyle(.black)
                            
                            
                        
                    }
                }
            }
            .padding(.top, 100)
            
            Spacer()
            
        }
    }
}

#Preview {
    ContentView()
}
