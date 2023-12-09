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
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title2)
            .foregroundStyle(.gray)
    }
}

extension Text {
    func textStyle () -> some View {
        modifier(TitleModifier())
    }
}
