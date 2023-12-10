//
//  QuestionsView2.swift
//  Educational
//
//  Created by Nicolas Florencio Felipe on 10/12/23.
//

import SwiftUI

struct QuestionsView2: View {
    var question: String
    
    var body: some View {
        VStack {
            Text(question)
        }
    }
}

#Preview {
    QuestionsView2(question: "hello")
}
