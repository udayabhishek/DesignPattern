//
//  LoginViewSnapshotTests.swift
//  LoginAppTests
//
//  Created by Uday Abhishek on 12/06/25.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import LoginApp

final class LoginAndSuccessViewTests: XCTestCase {

    func testLoginViewSnapshot() {
        let coordinator = AppCoordinator()
        let view = LoginView(coordinator: coordinator)
            .frame(width: 375, height: 667)

        assertSnapshot(of: view, as: .image(layout: .device(config: .iPhone13Pro)))
    }

    func testSuccessViewSnapshot() {
        var testUsername = "Uday"
        let bindingUsername = Binding<String>(
            get: { testUsername },
            set: { testUsername = $0 }
        )
        
        let view = SuccessView(username: bindingUsername)
            .frame(width: 375, height: 667)

        assertSnapshot(of: view, as: .image(layout: .device(config: .iPhone13Pro)))
    }
}
