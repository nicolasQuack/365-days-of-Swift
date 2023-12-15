//
//  Codable.swift
//  iExpense
//
//  Created by Nicolas Florencio Felipe on 14/12/23.
//

import SwiftUI

struct CodableView: View {
    @State private var user = User(firstName: "Nicolas", lastName: "Felipe")
    @State private var isToggle = false
    @State private var isShown = false
    
    @State private var firstName = String()
    @State private var lastName = String()
    
    var body: some View {
        VStack {
            
            TextField("Enter Your Name:", text: $user.firstName)
            TextField("Enter Your Last Name:", text: $user.lastName)
            
            Button ("Save User") {
                let enconder = JSONEncoder()
                
                if let data = try? enconder.encode(user) {
                    UserDefaults.standard.setValue(data, forKey: "UserData")
                }

            }
            
            Spacer()
            
            Button ("Show User") {
                let decoder = JSONDecoder()
                
                if let data = try? decoder.decode(User.self, from: UserDefaults.standard.data(forKey: "UserData")!) {
                    firstName = data.firstName
                    lastName = data.lastName
                }
                isShown.toggle()
            }
            
            if isShown {
                Text("\(firstName) \(lastName)")
                
            }
            
        }
    }
    
}


struct User: Codable {
    var firstName: String
    var lastName: String
    
}

struct UserDec: Decodable {
    let firstName: String
    let lastName: String
}

#Preview {
    CodableView()
}
