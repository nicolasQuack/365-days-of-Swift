//
//  ContentView.swift
//  BetterRest
//
//  Created by Nicolas Florencio Felipe on 21/11/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
        
    }
   
    @State private var wakeUp = defaultWakeUpTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    @State private var sleepTime = ""
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section ("When do you want to to wake up?"){
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                }
                
                Section ("Desired amount of sleep"){
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section ("Select your coffee amount per day"){
                    
                    Picker("Select your coffee amount per day", selection: $coffeeAmount) {
                        ForEach (1..<21) {
                            Text("^[\($0) cup](inflect: true)")
                        }
                    }
                    .labelsHidden()
                }
                
                Section ("Your ideal bedtime is..."){
                    Text(sleepTime)
                        .onAppear(perform: {
                            calculateBedTime()
                        })
                        .onChange(of: coffeeAmount) { oldValue, newValue in
                            calculateBedTime()
                        }
                        .onChange(of: wakeUp) { oldValue, newValue in
                            calculateBedTime()
                        }
                        .onChange(of: sleepAmount) { oldValue, newValue in
                            calculateBedTime()
                        }
                }
                
            }
            .navigationTitle("BetterRest")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    
    func calculateBedTime () {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let component = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (component.hour ?? 0) * 60 * 60
            let minute = (component.minute ?? 0) * 60 * 60
            let predication = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount+1))
            let time = wakeUp - predication.actualSleep
            sleepTime = time.formatted(date: .omitted, time: .shortened)

        } catch {
            sleepTime = "Sorry, there was a problem calculating your bedtime. "
        }
        
    }
    
}

#Preview {
    ContentView()
}
