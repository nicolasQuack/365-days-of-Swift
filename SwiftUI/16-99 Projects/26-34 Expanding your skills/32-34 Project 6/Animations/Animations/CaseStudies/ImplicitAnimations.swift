//
//  ImplicitAnimations.swift
//  Animations
//
//  Created by Nicolas Florencio Felipe on 30/11/23.
//

import SwiftUI

struct ImplicitAnimations: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Button ("Hello") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3/2)
            .animation(.default, value: animationAmount)
        }
    }
}

#Preview {
    ImplicitAnimations()
}
