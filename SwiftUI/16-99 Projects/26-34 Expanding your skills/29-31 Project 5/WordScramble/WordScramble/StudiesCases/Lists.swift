//
//  Lists.swift
//  WordScramble
//
//  Created by Nicolas Florencio Felipe on 26/11/23.
//

import SwiftUI

struct Lists: View {
    let people = ["Nicolas", "Marcos", "Bianca", "Paulo", "Gabriel"]
    var body: some View {
        
        List(people, id: \.self) {
            Text($0)
        }
        
//        List {
//
//            Section {
//                Text("Static row 0")
//                Text("Static row 1")
//                Text("Static row 2")
//            }
//
//            Section {
//                ForEach (0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//
//            Section {
//                Text("Static row 3")
//                Text("Static row 4")
//            }
//
//        }
        
    }
}

#Preview {
    Lists()
}
