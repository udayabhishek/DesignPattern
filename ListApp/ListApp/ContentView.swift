//
//  ContentView.swift
//  ListApp
//
//  Created by Uday Abhishek on 28/05/25.
//

import SwiftUI

struct ContentView: View {
    @State var listItems: [ListItems] = []
    @State var text: String = ""
    
    var body: some View {
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.cyan, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .edgesIgnoringSafeArea(.all)
//
            
            Color.blue
                            .ignoresSafeArea()
            NavigationView {
            
                VStack(spacing: 10) {
                    HStack {
                        TextField("Enter text", text: $text)
                            .padding()
                        
                            .textFieldStyle(.roundedBorder)
                        
                        Button(action: addItem) {
                            Text("Add")
                                .font(.body)
                                .frame(height: 60)
                        }
                        .padding()
                    }
                    
                    List(listItems) { item in
                        NavigationLink(destination: DetailView(item: item)) {
                            Text(item.title)
                        }
                    }
                    
                    .navigationTitle("TODO")
                    
                    Spacer()
                }
            }.scrollContentBackground(.hidden)
        }
    }
    
    private func addItem() {
        let trimmedTitle = text.trimmingCharacters(in: .whitespaces)
        guard !trimmedTitle.isEmpty else { return }
        let newItem = ListItems(title: trimmedTitle, description: "Description for \(trimmedTitle)")
        listItems.append(newItem)
        text = ""
    }
}

#Preview {
    ContentView()
}
