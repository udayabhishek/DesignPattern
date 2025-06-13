//
//  SwiftUIView.swift
//  LoginApp
//
//  Created by Uday Abhishek on 13/06/25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        switch coordinator.currentScreen {
        case .login:
            LoginView(coordinator: coordinator)
        case .success(var username):
            let user = Binding<String>(
                get: { username },
                set: { username = $0}
            )
            SuccessView(username: user)
        }
    }
}
