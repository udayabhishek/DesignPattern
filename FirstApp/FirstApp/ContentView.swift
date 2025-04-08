//
//  ContentView.swift
//  FirstApp
//
//  Created by Uday Abhishek on 08/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Login").font(.largeTitle).padding()
            TextField("UserName", text: $userName)
                .padding()
                .background(Color.gray)
                .cornerRadius(4)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray)
                .cornerRadius(4)
            
            HStack {
                Button(action: {
                    debugPrint("name: \(userName), password: \(password)")
                }, label: {
                    Text("Login")
                })
                
                Spacer()
                
                Button(action: {
                    debugPrint("signup")
                }, label: {
                    Text("Signup")
                })
            }.padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
