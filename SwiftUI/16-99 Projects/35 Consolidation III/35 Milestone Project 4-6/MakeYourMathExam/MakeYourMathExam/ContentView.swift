//
//  ContentView.swift
//  MakeYourMathExam
//
//  Created by Nicolas Florencio Felipe on 16/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var exam = Exam()
    
    @State private var isToggle = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Make your own math exam and guarantee yourself")
                    .textSubHeadlineStyle()
                
                Image("girlInMathExam")
                    .padding(.bottom, 100)
                
                HStack(spacing: 30) { Button ("Settings") {
                    isToggle.toggle()
                }
                .buttonStyle(.borderedProminent)
                    
                    
                NavigationLink("Generate") {
                    ExamView(exam: exam)
                }
                .buttonStyle(.borderedProminent)
                .disabled(exam.questions == [ExamQuestions]())
                    
                    
                }
                .navigationTitle("iMath")
                .sheet(isPresented: $isToggle, content: {
                    SettingsView(exam: exam)
                })
            }
            
        }
    }
}

#Preview {
    ContentView()
}
