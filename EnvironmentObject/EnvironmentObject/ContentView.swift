//
//  ContentView.swift
//  EnvironmentObject
//
//  Created by Uday Abhishek on 09/04/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var user: User = User()
    @ObservedObject private var account: Account = Account()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Logged in username = \(user.name)")
                
                TextField("Enter username", text: $user.name)
                    .textFieldStyle(.roundedBorder)
                
                NavigationLink("goto second view", destination: SecondView())
            }
            .padding()
            .navigationBarTitle(Text("Environment Object"))
        }
        .environmentObject(user)
        .environmentObject(account)
    }
}

#Preview {
    ContentView()
//        .environmentObject(User())
//        .environmentObject(Account())
}
