//
//  TextModifiers.swift
//  Educational
//
//  Created by Nicolas Florencio Felipe on 07/12/23.
//

import Foundation
import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.black)
            .font(.largeTitle)
            .fontWeight(.light)
            .shadow(radius: 20)
            .padding(.vertical)
    }
}

extension Text {
    func textStyle () -> some View {
        modifier(TitleModifier())
    }
}
