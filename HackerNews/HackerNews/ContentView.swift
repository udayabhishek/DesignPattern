//
//  ContentView.swift
//  HackerNews
//
//  Created by Uday Abhishek on 27/05/25.
//

import SwiftUI

struct ContentView: View {
   // @State var posts: [Post] = []
//    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                Text(post.title)
            }
            .navigationTitle("Hacker News")
        }
//        .onAppear {
//            networkManager.getData()
//        }
    }
}

#Preview {
    ContentView()
}

struct Post: Identifiable, Decodable {
    let id: Int
    let title: String
}

let posts: [Post] = [
    .init(id: 1, title: "Post 1"),
    .init(id: 2, title: "Post 2"),
    .init(id: 3, title: "Post 3"),
]

