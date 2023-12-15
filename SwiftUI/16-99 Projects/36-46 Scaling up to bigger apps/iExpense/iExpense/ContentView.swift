//
//  ContentView.swift
//  iExpense
//
//  Created by Nicolas Florencio Felipe on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense  ")
            .toolbar {
                Button ("Add Expense", systemImage: "plus") {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                }
            }
        }
    }
    
    func removeItems(at offSet: IndexSet) {
        expenses.items.remove(atOffsets: offSet)
    }
}

#Preview {
    ContentView()
}
