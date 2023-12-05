//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Nicolas Florencio Felipe on 31/10/23.
//

import SwiftUI

struct GameView: View {
    
    @State private var rightAnswer = false
    @State private var wrongAnswer = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var highScore = 0
//    @State private var counter = 0
    
    @State var numOfCorrectAnswer = Int.random(in: 0...2)
    // If remove a country, decrese in range.
    @State var myIndexes = Array(0...239).shuffled()
    
    var body: some View {
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.80, green: 0.2, blue: 0.2), location: 0.2),
                .init(color: Color(red: 0, green: 0, blue: 0), location: 0.3),
            ], center: .top, startRadius: 300, endRadius: 700)
            .opacity(0.8)
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack (spacing: 15) {
                    
                    Spacer()
                    Spacer()
                    
                    VStack{
                        
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countriesData[myIndexes[numOfCorrectAnswer]].name)
                            .font(.title2.weight(.bold))
                            .multilineTextAlignment(.center)
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(
                                    countriesData[myIndexes[number]]
                                        .id
                                        .lowercased()
                                )
                                .imageView()
                                .opacity(rightAnswer || wrongAnswer ? 0.25 : 1)
                                .animation(.easeOut(duration: 0.5), value: rightAnswer || wrongAnswer)
                                    
                            }
                            
                        }
                        
                    }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .padding(.horizontal, 50)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                    
                    Spacer()
                    
                VStack {
                    Text("Score: \(score)")
                            .foregroundStyle(.white)
                            .font(.title.bold())
                    Text("highscore: \(highScore)")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                }
                    
                    Spacer()
                    
                }
                
            }
            .padding()
            .disabled(rightAnswer || wrongAnswer /*|| counter == 8*/)

            
            ZStack {
                if rightAnswer {
                    AlertModel(title: "Correct Answer", message: "Alright, let's go!", imgPath: countriesData[myIndexes[numOfCorrectAnswer]].id.lowercased()) {
                        askQuestion()
                    }.transition(.earthRotation.combined(with: .scale))
                    
                }
                else if wrongAnswer {
                    AlertModel(title: "Wrong Answer", message: "Bad! You're the worst!", iconName: "figure.handball", imgPath: countriesData[myIndexes[numOfCorrectAnswer]].id.lowercased()) {
                        askQuestion()
                    }.transition(.earthRotation.combined(with: .scale))
                    
                } 
//                else if counter == 8 {
//                    AlertModel(title: "End Game!", message: "You're highscore are: \(highScore)", action: {
//                        resetAll()
//                    }, buttonText: "Reset")
//                }
                
            }
            .animation(.linear(duration: 0.5), value: wrongAnswer)
            .animation(.easeIn(duration: 0.5), value: rightAnswer)
            
        }        
        .preferredColorScheme(.dark)

        
    }
    
    func flagTapped(_ number: Int) {
        if number == numOfCorrectAnswer {
            scoreTitle = "Correct"
            score += 1
            rightAnswer = true
            if highScore < score {
                highScore = score
            }
        } else {
            scoreTitle = "Wrong"
            score = 0
            wrongAnswer = true
        }
        
//        counter += 1
        
    }
    
//    func resetAll () {
//        score = 0
//        scoreTitle = ""
//        rightAnswer = false
//        wrongAnswer = false
//        highScore = 0
//        counter = 0
//    }
    
    func askQuestion() {
        myIndexes.shuffle()
        numOfCorrectAnswer = Int.random(in: 0...2)
        rightAnswer = false
        wrongAnswer = false
    }
    
}

#Preview {
    GameView()
}
