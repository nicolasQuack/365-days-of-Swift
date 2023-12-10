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
    
    var difficultyCalculator: Array<Int> {
        var multiplicationArr: Array<Int>
        switch currentDifficulty {
            case .easy:
            multiplicationArr = Array(1...5)
            case .moderate:
            multiplicationArr = Array(5...9)
            case .hard:
            multiplicationArr = Array(9...14)
        }
        return multiplicationArr
    }
    
    @State private var difficultyLevel: Array<Difficulty> = [.easy, .moderate, .hard]
    @State private var rangeOfQuestions: Array<Int> = [5, 10, 15]
    
    @State private var currentDifficulty: Difficulty = .moderate
    @State private var currentNumOfQuestions: Int = 10
    @State private var obj = Game(multipliers: [1,2,3], numOfQuestions: 5)
    
    @State private var isPressed = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    
                    //Select difficulty
                    Section {
                        
                        Text("Select difficulty:")
                            .textStyle()
                        
                        HStack (spacing: 20) {
                            ForEach(0..<difficultyLevel.count, id: \.self) { num in
                                
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
                                        .opacity(difficultyLevel[num] != currentDifficulty ? 0.3 : 1.0)
                                        .animation(.linear(duration: 0.8), value: currentDifficulty)
                                }
                            }
                        }
                    }
                    
                    //Number of Questions
                    Section {
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
                    
                    //Generate button
                    Section {
                        Button {
                            obj = Game(multipliers: difficultyCalculator, numOfQuestions: currentNumOfQuestions)
                            withAnimation {
                                isPressed.toggle()
                            }
                        } label: {
                            ZStack {
                                Rectangle()
                                    .fill(.thinMaterial)
                                    .frame(width: 100, height: 50)
                                    .clipShape(.buttonBorder)
                                    .shadow(radius: 10)
                                
                                Text("Start")
                                    .animation(.default.delay(0.35))
                                
                            }
                        }
                        .padding(.top, 30)
                        .navigationDestination(isPresented: $isPressed) {
                            QuestionsView(gameObject: obj)
                                .navigationTitle("Exam")
                        }
        //
        //                if isPressed {
        //                    QuestionsView(gameObject: obj)
        //                        .transition(.asymmetric(insertion: .push(from: .bottom), removal: .push(from: .top)))
        //
        //                }
                        
                    }
                    .padding(.bottom)
                }
                .padding(.vertical)
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
