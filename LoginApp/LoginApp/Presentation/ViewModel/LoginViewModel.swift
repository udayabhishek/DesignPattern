//
//  LoginViewModel.swift
//  LoginTestApp
//
//  Created by Uday Abhishek on 11/06/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var error: String?

    private var cancellables = Set<AnyCancellable>()
    private let loginUseCase: LoginUseCase

    init(loginUseCase: LoginUseCase = LoginUseCase()) {
        self.loginUseCase = loginUseCase
    }

    var isValid: Bool {
        !username.isEmpty && !password.isEmpty && password.count >= 5
    }

    func login() {
        guard isValid else { return }
        isLoading = true
        error = nil

        loginUseCase.execute(username: username, password: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case .failure(let err) = completion {
                    self?.error = err.localizedDescription
                }
            } receiveValue: { [weak self] success in
                self?.isLoggedIn = success
            }
            .store(in: &cancellables)
    }
}
