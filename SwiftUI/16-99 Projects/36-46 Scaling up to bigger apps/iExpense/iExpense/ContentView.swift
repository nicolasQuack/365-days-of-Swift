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
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: usrRegionCode))
                            .foregroundStyle(item.amount > 10.00 ? . red : .black)
                            .bold(item.amount > 100.00)
                    }
                    
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense  ")
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
