//
//  AppCoordinator.swift
//  LoginApp
//
//  Created by Uday Abhishek on 13/06/25.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    enum Screen {
        case login
        case success(username: String)
    }

    @Published var currentScreen: Screen = .login

    func navigateToSuccess(username: String) {
        currentScreen = .success(username: username)
    }

    func goBackToLogin() {
        currentScreen = .login
    }
}
