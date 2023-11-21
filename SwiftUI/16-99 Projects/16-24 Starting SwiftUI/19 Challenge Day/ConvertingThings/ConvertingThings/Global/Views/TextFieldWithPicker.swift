//
//  TextFieldWithPicker.swift
//  ConvertingThings
//
//  Created by Nicolas Florencio Felipe on 30/10/23.
//

import SwiftUI

struct TextFieldWithPicker: View {
    @Binding var value: String
    var inputPlaceHolder: String
    @Binding var pickerSelection: Int
    var pickerOption: Array<Scale>
    
    @FocusState var isToggle: Bool
    
    var body: some View {
        ZStack {
            HStack {
                TextField(inputPlaceHolder, text: $value)
                    .focused($isToggle)
                
                    Rectangle()
                        .frame(width: 1)
                        .padding(.vertical, 4)
                        .foregroundStyle(.gray)
                    
                    Picker(selection: $pickerSelection) {
                        ForEach (pickerOption) {
                            Text($0.name)
                                .tag($0.id)
                        }
                    } label: { EmptyView() }
            }
            
        }
        .frame(height: 32)
        .toolbar {
            if isToggle {
                Button("Done") {
                    isToggle = false
                }
            }
        }
        
    }
}

#Preview {
    TextFieldWithPicker(
        value: .constant(""),
        inputPlaceHolder: "",
        pickerSelection: .constant(1),
        pickerOption: []
    )
}
