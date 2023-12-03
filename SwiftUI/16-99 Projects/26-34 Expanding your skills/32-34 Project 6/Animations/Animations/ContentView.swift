//
//  ContentView.swift
//  Animations
//
//  Created by Nicolas Florencio Felipe on 30/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    
    var body: some View {
        Button ("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 40))
        .animation(.spring(duration: 1, bounce: 0.5), value: enabled)
        
    }
}

#Preview {
    ContentView()
}
