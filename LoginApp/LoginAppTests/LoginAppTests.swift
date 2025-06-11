//
//  LoginAppTests.swift
//  LoginAppTests
//
//  Created by Uday Abhishek on 11/06/25.
//

import XCTest
import Combine

final class LoginAppTests: XCTestCase {
    var viewModel: LoginViewModel!
    var cancellables: Set<AnyCancellable>!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
