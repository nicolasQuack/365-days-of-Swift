//
//  DeleteModifier.swift
//  iExpense
//
//  Created by Nicolas Florencio Felipe on 14/12/23.
//

import SwiftUI

struct DeleteModifier: View {
    @State private var number = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(number, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button ("Add Number") {
                    withAnimation {
                        number.append(currentNumber)
                        currentNumber += 1
                    }
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows (at offsets: IndexSet) {
        number.remove(atOffsets: offsets)
    }
}

#Preview {
    DeleteModifier()
}
