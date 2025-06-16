//
//  ContentView.swift
//  APICallTest
//
//  Created by Uday Abhishek on 16/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        VStack {
            Button("Load Posts") {
                Task {
                    await viewModel.fetchPosts()
//                    await viewModel.fetchPosts1()
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            List(viewModel.posts) { post in
                Text(post.title)
            }
            
//            List(viewModel.users) { user in
//                Text(user.name)
//            }
        }
        .padding()
    }
}

#Preview {
    
}
