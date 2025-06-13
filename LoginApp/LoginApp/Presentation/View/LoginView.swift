//
//  LoginView.swift
//  LoginTestApp
//
//  Created by Uday Abhishek on 11/06/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
                .padding()
            
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if viewModel.isLoading {
                ProgressView()
            } else {
                Button("Login") {
                    viewModel.login()
                }
                .disabled(!viewModel.isValid)
                .padding()
            }

            if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
            SuccessView(username: $viewModel.username)
        }
        
        Spacer()
    }
}

#Preview {
    LoginView()
}

