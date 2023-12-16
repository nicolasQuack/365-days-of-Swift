//
//  CardContent.swift
//  iExpense
//
//  Created by Nicolas Florencio Felipe on 16/12/23.
//

import SwiftUI

struct CardContent: View {
    
    let name: String
    let type: String
    let amount: Double
    
    let usrRegionCode = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(type)
            }
            
            Spacer()
            Text(amount, format: .currency(code: usrRegionCode))
                .foregroundStyle(amount > 10.00 ? . red : .primary)
                .fontWeight(amount < 1000.00 ? .bold : .heavy)
        }
    }
}

#Preview {
    CardContent(name: "test", type: "test", amount: 20.00)
}
