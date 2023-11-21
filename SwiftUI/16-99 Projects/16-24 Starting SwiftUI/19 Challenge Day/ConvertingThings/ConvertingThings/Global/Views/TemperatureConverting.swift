//
//  TemperatureConverting.swift
//  ConvertingThings
//
//  Created by Nicolas Florencio Felipe on 30/10/23.
//

import SwiftUI

struct TemperatureConverting: View {
    
    @State private var temperatureValue: String = ""
    @State private var currentTemperature: Int = 1
    @State private var convertTo: Int = 1
    let temperatureArr: Array<Scale> = [
        Scale(id: 1, name: "Celsius"),
        Scale(id: 2, name: "Fahrenheint"),
        Scale(id: 3, name: "Kelvin")
    ]
    
    private var convertedValue:Double {
        let doubleValue = Double(temperatureValue) ?? 0.0
        
        if currentTemperature == convertTo {
            return doubleValue;
        }
        
        if currentTemperature == 1 {
            if convertTo == 2 {
                return doubleValue*(9/5)+32
            } else {
                return doubleValue+273.15
            }
        }
        
        if currentTemperature == 2 {
            if convertTo == 1 {
                return (doubleValue - 32)*5/9
            } else {
                return (((doubleValue - 32) * 5/9) + 273.15)
            }
        }
        
        if currentTemperature == 3 {
            if convertTo == 1 {
                return doubleValue - 273.15
            } else {
                return (((doubleValue - 273.15) * 9/5) + 32)
            }
        }
        
        return 0.0
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    
                    TextFieldWithPicker(value: $temperatureValue, inputPlaceHolder: "Converter", pickerSelection: $currentTemperature, pickerOption: temperatureArr)
                        .keyboardType(.decimalPad)
                        
                    Picker("Para", selection: $convertTo) {
                        ForEach(temperatureArr) {
                            Text($0.name)
                                .tag($0.id)
                        }
                    }
                    
                }
                    
                Section ("Resultado") {
                    Text("\(convertedValue, specifier: "%.2f")")
                        .font(.title)
                        .foregroundColor(.pink)

                }
                    
            }
            .navigationTitle("Temperaturas")
            .navigationBarTitleDisplayMode(.inline)
                
            
        }
        }
    }

#Preview {
    TemperatureConverting()
}
