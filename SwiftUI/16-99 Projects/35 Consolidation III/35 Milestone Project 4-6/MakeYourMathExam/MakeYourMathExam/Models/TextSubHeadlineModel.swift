//
//  TextSubHeadlineModel.swift
//  MakeYourMathExam
//
//  Created by Nicolas Florencio Felipe on 16/12/23.
//

import SwiftUI

struct TextSubHeadlineModel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.gray)
            .font(.subheadline)
            .padding(.bottom, -20)
    }
}

extension Text {
    func textSubHeadlineStyle () -> some View {
        modifier(TextSubHeadlineModel())
    }
}
