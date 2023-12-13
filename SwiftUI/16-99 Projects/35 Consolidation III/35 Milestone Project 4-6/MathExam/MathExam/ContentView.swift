//
//  ContentView.swift
//  MathExam
//
//  Created by Nicolas Florencio Felipe on 12/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var multi = 5
    @State private var range = 10
    
    @State var isModal: Bool = false
    
    @State var arrOfQuestions: Array<Question> = []
    
    var body: some View {
        NavigationStack() {
            VStack {
                List {
                    Section ("Select your multiplier:") {
                        Stepper("Multiplier: \(multi)", value: $multi, in: 2...12)
                    }
                    
                    Section ("Select how many questions:") {
                        Stepper("Questions: \(range)", value: $range, in: 5...15, step: 5)
                    }
                }
                .navigationTitle("Generate Exam")
                
                Button ("Generate") {
                    self.isModal.toggle()
                    for _ in 0..<range {
                        let question = Question(x: multi, y: Array(2...12).shuffled()[0])
                        arrOfQuestions.append(question)
                    }
                }
                .padding([.top, .bottom], 50)
                .navigationDestination(isPresented: $isModal, destination: {
                    GameView(arrayOfQuestions: arrOfQuestions)
                })
                .onAppear(
                    perform: {
                        arrOfQuestions = []
                    }
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
