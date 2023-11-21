//
//  ContentView.swift
//  WeSplit
//
//  Created by Nicolas Florencio Felipe on 26/10/23.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    
    let rangeForTip = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    let localeCurrent = Locale.current.currency?.identifier ?? "USD"
    
    private var peopleCount: Double {
        return Double(numberOfPeople + 2)
    }
    
    private var tipSelection: Double {
        return Double(tipPercentage)
    }
    
    private var tipValue: Double {
        return checkAmount / 100 * tipSelection
    }
    
    private var total: Double {
       return checkAmount + tipValue
    }
    var totalPerPerson: Double {
        return total / peopleCount
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: localeCurrent))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                }
                
                Section("How much tip do you want to leave?") {
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(rangeForTip, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                }
                
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: localeCurrent))
                }
                
                Section("Total") {
                    Text(total, format: .currency(code: localeCurrent))
                        .foregroundStyle(tipPercentage == 0 ? .red : .blue)

                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
    }

}

#Preview {
    ContentView()
}
