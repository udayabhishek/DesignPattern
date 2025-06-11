//
//  LoginTestAppUnitTests.swift
//  LoginTestAppUnitTests
//
//  Created by Uday Abhishek on 11/06/25.
//

import Testing

struct LoginTestAppUnitTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    
    

}


class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
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

    func testLoginFailure() {
        let expectation = XCTestExpectation(description: "Login fails")

        viewModel.username = "wronguser"
        viewModel.password = "wrongpassword"

        viewModel.$error
            .dropFirst()
            .sink { error in
                if error != nil {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.login()
        wait(for: [expectation], timeout: 5.0)
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
}

