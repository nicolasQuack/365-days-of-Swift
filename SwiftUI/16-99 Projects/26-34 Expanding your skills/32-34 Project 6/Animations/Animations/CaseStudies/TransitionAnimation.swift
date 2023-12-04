//
//  TransitionAnimation.swift
//  Animations
//
//  Created by Nicolas Florencio Felipe on 04/12/23.
//

import SwiftUI

struct TransitionAnimation: View {
    @State private var isShowing = false
    
    var body: some View {
            Button ("Tap me!") {
                withAnimation {
                    isShowing.toggle()
                }
            }
            
            if isShowing {
                    Circle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.scale)
            }
    }
}

#Preview {
    TransitionAnimation()
}
