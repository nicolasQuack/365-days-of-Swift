//
//  ContentView.swift
//  iExpense
//
//  Created by Nicolas Florencio Felipe on 14/12/23.
//

import SwiftUI

struct SheetModifier: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@nicolasQuack")
        }
    }
    
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello, \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    SheetModifier()
}
