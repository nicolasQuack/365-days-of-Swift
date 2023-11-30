//
//  CustomAnimations.swift
//  Animations
//
//  Created by Nicolas Florencio Felipe on 30/11/23.
//

import SwiftUI

struct CustomAnimations: View {
    @State private var animationAmount = 1.0
    @State private var test = 1.0
    
    var body: some View {
        VStack {
            Button ("Ninguem aqui") {

            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 3)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
        }
    }
}

#Preview {
    CustomAnimations()
}
