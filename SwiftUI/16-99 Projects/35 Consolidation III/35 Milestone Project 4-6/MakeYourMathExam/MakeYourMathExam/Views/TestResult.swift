//
//  testResult.swift
//  MakeYourMathExam
//
//  Created by Nicolas Florencio Felipe on 19/12/23.
//

import SwiftUI

struct TestResult: View {
    
    @State var exam: Exam
    
    var computedResult: Int {
        
        var score = 0
        
        for i in exam.questions {
            if Int(i.userAnswer) == i.answer {
                score += 1
            }
        }
        
        return score
    }
    
    var wrongResults: Array<ExamQuestions> {
        
        var arr: Array<ExamQuestions> = []
        
        for i in exam.questions {
            if Int(i.userAnswer) != i.answer {
                arr.append(i)
            }
        }
        
        return arr
    }
    
    var rightResults: Array<ExamQuestions> {
        
        var arr: Array<ExamQuestions> = []
        
        for i in exam.questions {
            if Int(i.userAnswer) == i.answer {
                arr.append(i)
            }
        }
        
        return arr
    }
    
    var computedNavTitle: String {
        if (Double(computedResult)/Double(exam.questions.count)) >= 0.7 {
            return "Approved"
        }
        
        return "Reproved"
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section ("") {
                        Text("Accuracy: \(computedResult)/\(exam.questions.count)")
                    }
                    if computedNavTitle == "Reproved" {
                        Image(.girlsSearching)
                    }
                    if computedNavTitle == "Approved" {
                        Image(.girlInMontain)
                    }
                    
                    NavigationLink ("More details") {
                        List{
                            if wrongResults != [] {
                                Section("Your Wrong Answers") {
                                    ForEach(wrongResults) { j in
                                        DetailsModel(question: "\(j.x) X \(j.y)", answer: "\(j.userAnswer)", rightAnswer: j.answer)
                                    }
                                }
                            }
                            
                            if rightResults != [] {
                                Section("Your Right Answers") {
                                    ForEach(rightResults) { j in
                                        DetailsModel(question: "\(j.x) X \(j.y)", answer: "\(j.userAnswer)", rightAnswer: j.answer)
                                    }
                                }
                            }
                        }
                        .navigationTitle("Details")
                    }
                }
                
                NavigationLink ("Back to menu") {
                    ContentView()
                        .navigationBarBackButtonHidden()
                        .navigationBarTitleDisplayMode(.large)
                }
                .padding()
                
            }
            .navigationTitle("\(computedNavTitle)")
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    TestResult(exam: Exam())
}
