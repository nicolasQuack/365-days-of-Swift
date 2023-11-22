//
//  ContentView.swift
//  BetterRest
//
//  Created by Nicolas Florencio Felipe on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        Text(Date.now.formatted(date: .long, time: .shortened))
        
    }
    
}

#Preview {
    ContentView()
}
