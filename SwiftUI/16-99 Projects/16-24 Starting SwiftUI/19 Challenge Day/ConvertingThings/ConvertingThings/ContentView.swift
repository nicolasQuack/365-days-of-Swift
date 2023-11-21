//
//  ContentView.swift
//  ConvertingThings
//
//  Created by Nicolas Florencio Felipe on 30/10/23.
//

import SwiftUI



struct ContentView: View {
    @State private var scheme: ColorScheme = .light
        
    func toggleScheme() {
        if scheme == .light {
            scheme = .dark
        } else {
            scheme = .light
        }
    }
    
    var body: some View{
        NavigationStack {
            Form {
                Section {
                    NavigationLink {
                        TemperatureConverting()
                    } label: {
                        Text("Temperaturas")
                    }
                    
                    NavigationLink {
                        LengthConverting()
                    } label: {
                        Text("Comprimento")
                    }
                }
                
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    self.toggleScheme()
                } label: {
                    Label("", systemImage: "cloud.sun.fill")
                }
                
            }
        }.preferredColorScheme(scheme)
        
        
    }
}

#Preview {
    ContentView()
}
