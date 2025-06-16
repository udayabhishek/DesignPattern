//
//  APIService.swift
//  APICallTest
//
//  Created by Uday Abhishek on 16/06/25.
//

import Foundation

@MainActor
class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var users: [User] = []
    
//https://jsonplaceholder.typicode.com/posts
//https://jsonplaceholder.typicode.com/users
    func fetchPosts() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Post].self, from: data)
            self.posts = decoded
        } catch {
            print("API error: \(error.localizedDescription)")
        }
    }
    
//    
//    func fetchUsers() async {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
//            print("Invalid URL")
//            return
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decoded = try JSONDecoder().decode([User].self, from: data)
//            self.users = decoded
//        } catch {
//            print("API error: \(error.localizedDescription)")
//        }
//    }
    
    
}
