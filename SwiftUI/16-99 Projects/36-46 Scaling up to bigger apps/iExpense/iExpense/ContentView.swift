//
//  ContentView.swift
//  iExpense
//
//  Created by Nicolas Florencio Felipe on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    let usrRegionCode = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            CardContent(name: item.name, type: item.type, amount: item.amount)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                
                Section("Business") {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            CardContent(name: item.name, type: item.type, amount: item.amount)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button ("Add Expense", systemImage: "plus") {
                    showingAddExpense.toggle()
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offSet: IndexSet) {
        expenses.items.remove(atOffsets: offSet)
    }
}

#Preview {
    ContentView()
}
