//
//  LoginAppTests.swift
//  LoginAppTests
//
//  Created by Uday Abhishek on 12/06/25.
//

import XCTest
import Combine

final class LoginAppTests: XCTestCase {
    var viewModel: LoginViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        super.setUp()
        viewModel = LoginViewModel()
        cancellables = []
    }
    
    func testLoginSuccess() {
        let expectation = XCTestExpectation(description: "Login succeeds")
        
        viewModel.username = "testuser"
        viewModel.password = "password"
        
        viewModel.$isLoggedIn
            .dropFirst()
            .sink { isLoggedIn in
                if isLoggedIn {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.login()
        wait(for: [expectation], timeout: 5.0)
    }
    
    /*
    func testLoginFailure() async {
        let expectation = XCTestExpectation(description: "Login fails")

        viewModel.username = "wronguser"
        viewModel.password = "wrongpassword"

        // Observe the error property
        viewModel.$error
            .dropFirst()
            .sink { error in
                if error != nil {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        await viewModel.login()
        await fulfillment(of: [expectation], timeout: 5.0)
    }
     */
    
    override func tearDownWithError() throws {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
}
