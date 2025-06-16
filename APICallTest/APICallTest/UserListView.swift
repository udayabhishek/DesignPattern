//
//  UserListView.swift
//  APICallTest
//
//  Created by Uday Abhishek on 16/06/25.
//

import SwiftUI

import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        VStack {
            Button("Load Users") {
                // Call async function in a Task
                Task {
                    await viewModel.fetchUsers()
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            List(viewModel.users) { user in
                VStack(alignment: .leading) {
                    Text(user.name).font(.headline)
                    Text(user.email).font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}

#Preview {
    UserListView()
}
