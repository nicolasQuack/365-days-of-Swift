//
//  ContentView.swift
//  Animations
//
//  Created by Nicolas Florencio Felipe on 30/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    @State private var height = UIScreen.main.bounds.height*0.5
    
    var body: some View {
        Button {
            enabled.toggle()
            if height == UIScreen.main.bounds.height*0.5 {
                height = UIScreen.main.bounds.height*0.3
            } else if height == UIScreen.main.bounds.height*0.3 {
                height = UIScreen.main.bounds.height*0.5
            }
        } label: {
            Rectangle()
                .frame(width: 200, height: 200)
                .background(enabled ? .blue : .red)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: enabled ? 60 : 40))
                .position(CGPoint(x: UIScreen.main.bounds.width*0.5, y: height))
                .animation(.easeIn, value: enabled)
                .animation(.spring(duration: 1, bounce: 0.5), value: enabled)
                
        }
        
        
    }
}

#Preview {
    ContentView()
}
