//
//  BindedAnimations.swift
//  Animations
//
//  Created by Nicolas Florencio Felipe on 30/11/23.
//

import SwiftUI

struct BindedAnimations: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        
        print(animationAmount)
        
        return VStack {
            Stepper(
                    "Scale amount",
                    value: $animationAmount.animation(
                        .easeIn(duration: 1)
                            .repeatCount(1, autoreverses: false)
                    ),
                    in: 1...10
                    )
            
            Spacer()
            
            Button ("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}

#Preview {
    BindedAnimations()
}
