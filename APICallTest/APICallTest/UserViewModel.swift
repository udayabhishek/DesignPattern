//
//  UserViewModel.swift
//  APICallTest
//
//  Created by Uday Abhishek on 16/06/25.
//

import Foundation

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    @Published var users: [User] = []

    func fetchUsers() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("❌ Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([User].self, from: data)
            self.users = decoded
        } catch {
            print("❌ API error: \(error.localizedDescription)")
        }
    }
}
