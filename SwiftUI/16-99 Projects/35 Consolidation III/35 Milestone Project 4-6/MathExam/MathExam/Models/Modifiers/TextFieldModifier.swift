//
//  TextFieldModifier.swift
//  MathExam
//
//  Created by Nicolas Florencio Felipe on 13/12/23.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 100)
            .padding()
            .background(.ultraThickMaterial)
            .clipShape(.capsule)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
    }
}

extension TextField {
    func textFieldStyle() -> some View {
        modifier(TextFieldModifier())
    }
}
