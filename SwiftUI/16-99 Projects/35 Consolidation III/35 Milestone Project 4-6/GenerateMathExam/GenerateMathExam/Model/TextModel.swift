//
//  TextModel.swift
//  GenerateMathExam
//
//  Created by Nicolas Florencio Felipe on 11/12/23.
//

import Foundation
import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension Text {
    func titleStyle () -> some View {
        modifier(TitleModifier())
    }
}
