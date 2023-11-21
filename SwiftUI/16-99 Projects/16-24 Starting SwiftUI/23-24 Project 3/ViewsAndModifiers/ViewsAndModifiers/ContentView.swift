//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Nicolas Florencio Felipe on 06/11/23.
//

import SwiftUI

struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        VStack {
            content
                .font(.largeTitle)
                .foregroundStyle(.blue)
        }
    }
}

extension View {
    func titleText() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedToEmails = false

    var body: some View {
        let agreedToAll = Binding<Bool>(
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
            },
            set: {
                agreedToTerms = $0
                agreedToPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )

        return VStack {
            Toggle("Agree to terms", isOn: $agreedToTerms)
            Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
            Toggle("Agree to receive shipping emails", isOn: $agreedToEmails)
            Toggle("Agree to all", isOn: agreedToAll)
        }
    }
}

#Preview {
    ContentView()
}
