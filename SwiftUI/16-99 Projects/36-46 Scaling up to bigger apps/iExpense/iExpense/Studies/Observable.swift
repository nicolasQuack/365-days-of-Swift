//
//  ContentView.swift
//  iExpense
//
//  Created by Nicolas Florencio Felipe on 14/12/23.
//

import SwiftUI
import Observation

struct ObservableView: View {
//    @State private var user = Person()

    var body: some View {
        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName).")
//
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
        }
    }
}

//@Observable
//class Person {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

/// When we add @State to a instance, Swift will observe this variable when he change, here, Swift would change when the object was re-invoke, but class not is re-invoked, because that's a class and struct is re-invoked because when changed any thing inside him, the struct was re-created;
/// Adding the @Observable, we will assist class when he changed and send the feature, but not re-create;
/// When we work with structs, the @State property wrapper keeps a value alive and also watches it for changes. On the other hand, whe working with classes, @State is just there for keeping object alive - all the watching for changes and updating the view is taken cara of by @Observable.

#Preview {
    ObservableView()
}
