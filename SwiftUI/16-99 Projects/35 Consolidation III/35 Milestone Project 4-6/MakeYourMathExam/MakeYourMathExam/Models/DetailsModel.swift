//
//  CardContent.swift
//  iExpense
//
//  Created by Nicolas Florencio Felipe on 16/12/23.
//

import SwiftUI

struct DetailsModel: View {
    
    let question: String
    let answer: String
    let rightAnswer: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Text("\(question)  =")
                        .font(.headline)
                    Text(answer)
                        .foregroundStyle(Int(answer) == rightAnswer ? .green : .red)
                }
            }
            
            Spacer()
            Text("\(rightAnswer)")
                .foregroundStyle(.green)
        }
    }
}

#Preview {
    DetailsModel(question: "Hello", answer: "Hello", rightAnswer: 12)
}
