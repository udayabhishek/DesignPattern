//
//  ContentView.swift
//  ObservableObject
//
//  Created by Uday Abhishek on 09/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var stUser = STUser()
    @ObservedObject private var clUser = CLUser()
    
    var body: some View {
        VStack {
            Text("Hi \(stUser.name)").font(.title).padding()
            
            
            TextField("User Name", text: $stUser.name)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            
            //Using Class
            Text("Hey \(clUser.name)").font(.title)
            TextField("User Name", text: $clUser.name)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
