//
//  LengthConverting.swift
//  ConvertingThings
//
//  Created by Nicolas Florencio Felipe on 30/10/23.
//

import SwiftUI

struct LengthConverting: View {
    @State private var lengthValue: String = ""
    @State private var currentLength: Int = 4
    @State private var convertTo: Int = 7
    let lengthArr: Array<Scale> = [
        Scale(id: 1, name: "mm"),
        Scale(id: 2, name: "cm"),
        Scale(id: 3, name: "dm"),
        Scale(id: 4, name: "m"),
        Scale(id: 5, name: "dam"),
        Scale(id: 6, name: "hm"),
        Scale(id: 7, name: "km")
    ]
    
    private var convertedValue:Double {
        let doubleValue = Double(lengthValue) ?? 0.0
        
        if currentLength == convertTo {
            return doubleValue
        }
        
        if currentLength == 1 {
            if convertTo == 2 {
                return doubleValue/10
            } else if convertTo == 3 {
                return doubleValue/100
            } else if convertTo == 4 {
                return doubleValue/1000
            } else if convertTo == 5 {
                return doubleValue/10000
            } else if convertTo == 6 {
                return doubleValue/100000
            } else {
                return doubleValue/1000000
            }
        }
        
        if currentLength == 2 {
            if convertTo == 1 {
                return doubleValue*10
            } else if convertTo == 3 {
                return doubleValue/10
            } else if convertTo == 4 {
                return doubleValue/100
            } else if convertTo == 5 {
                return doubleValue/1000
            } else if convertTo == 6 {
                return doubleValue/10000
            } else {
                return doubleValue/100000
            }
        }
        
        if currentLength == 3 {
            if convertTo == 1 {
                return doubleValue*100
            } else if convertTo == 2 {
                return doubleValue*10
            } else if convertTo == 4 {
                return doubleValue/10
            } else if convertTo == 5 {
                return doubleValue/100
            } else if convertTo == 6 {
                return doubleValue/1000
            } else {
                return doubleValue/10000
            }
        }
        
        if currentLength == 4 {
            if convertTo == 1 {
                return doubleValue*1000
            } else if convertTo == 2 {
                return doubleValue*100
            } else if convertTo == 3 {
                return doubleValue*10
            } else if convertTo == 5 {
                return doubleValue/10
            } else if convertTo == 6 {
                return doubleValue/100
            } else {
                return doubleValue/1000
            }
        }
        
        if currentLength == 5 {
            if convertTo == 1 {
                return doubleValue*10000
            } else if convertTo == 2 {
                return doubleValue*1000
            } else if convertTo == 3 {
                return doubleValue*100
            } else if convertTo == 4 {
                return doubleValue*10
            } else if convertTo == 6 {
                return doubleValue/10
            } else {
                return doubleValue/100
            }
        }
        
        if currentLength == 6 {
            if convertTo == 1 {
                return doubleValue*100000
            } else if convertTo == 2 {
                return doubleValue*10000
            } else if convertTo == 3 {
                return doubleValue*1000
            } else if convertTo == 4 {
                return doubleValue*100
            } else if convertTo == 5 {
                return doubleValue*10
            } else {
                return doubleValue/10
            }
        }
        
        if currentLength == 7 {
            if convertTo == 1 {
                return doubleValue*1000000
            } else if convertTo == 2 {
                return doubleValue*100000
            } else if convertTo == 3 {
                return doubleValue*10000
            } else if convertTo == 4 {
                return doubleValue*1000
            } else if convertTo == 5 {
                return doubleValue*100
            } else {
                return doubleValue*10
            }
        }
        
        return doubleValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    
                    TextFieldWithPicker(value: $lengthValue, inputPlaceHolder: "Converter", pickerSelection: $currentLength, pickerOption: lengthArr)
                        .keyboardType(.decimalPad)
                        
                    Picker("Para", selection: $convertTo) {
                        ForEach(lengthArr) {
                            Text($0.name)
                                .tag($0.id)
                        }
                    }
                    
                }
                    
                Section ("Resultado") {
                    Text("\(convertedValue, specifier: "%.6f")")
                        .font(.title)
                        .foregroundColor(.pink)

                }
                    
            }
            .navigationTitle("Comprimentos")
            .navigationBarTitleDisplayMode(.inline)
                
            
        }
    }
}

#Preview {
    LengthConverting()
}
