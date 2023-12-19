 //
//  GenerateConfigView.swift
//  MakeYourMathExam
//
//  Created by Nicolas Florencio Felipe on 16/12/23.
//

import SwiftUI

struct SettingsView: View {
    
    var exam: Exam
    
    @Environment(\.dismiss) var dismiss
    
    @State private var currentDifficulty: Difficulty = .moderate
    let difficultyArr: Array<Difficulty> = [.easy, .moderate, .hard]
    
    @State private var currentNumOfQuestion: Int = 10
    let numOfQuestionsArr: Array<Int> = [5, 10, 15]
    
    var body: some View {
        NavigationStack {
            List {
                Section ("Select difficulty: "){
                    Picker("Select difficulty", selection: $currentDifficulty) {
                        ForEach(difficultyArr, id: \.self) {
                            Text($0 == .easy ? "Easy" : $0 == .moderate ? "Moderate" : "Hard")
                        }
                    }
                    .padding(-10)
                    .pickerStyle(.palette)
                }
                
                Section ("Select Number of Questions:") {
                    Stepper("Questions: \(currentNumOfQuestion)", value: $currentNumOfQuestion, in: 5...15, step: 5)
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                Button("Save") {
                    exam.questions = []
                    exam.generateQuestions(currentNumOfQuestion, currentDifficulty)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    SettingsView(exam: Exam())
}
