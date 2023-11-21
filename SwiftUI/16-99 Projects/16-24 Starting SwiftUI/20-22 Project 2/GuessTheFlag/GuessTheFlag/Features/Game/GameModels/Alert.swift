//
//  Alert.swift
//  GuessTheFlag
//
//  Created by Nicolas Florencio Felipe on 03/11/23.
//

import SwiftUI

struct AlertModel: View {
    var title: String
    var message: String
    var iconName: String?
    var imgPath: String?
    var action: () -> Void
    var buttonText: String?
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .font(.headline)
                .tint(.primary)
            
            HStack {
                Text(message)
                    .font(.body)
                    .tint(.primary)
                if let icon = iconName {
                    Image(systemName: icon)
                }
            }
            
            if let imgPath = self.imgPath {
                VStack {
                    Image(imgPath)
                        .resizable()
                        .aspectRatio(1.7, contentMode: .fit)
                }
                .frame(width: 150, height: 100)
            }
            
            Divider()
                .frame(width: 250)
                
                
            
            Button(action: action, label: {
                Text(buttonText ?? "OK")
                    .foregroundStyle(Color.red)
            })
 
            
        }
        .padding()
        
        .background(.regularMaterial)
        .cornerRadius(10)
        
    }
    
}

#Preview {
    AlertModel(title: "Correct answer", message: "Alright!", imgPath: "br") {
        
    }
}
