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

class LoginViewTests: XCTestCase {
    func testLoginViewSnapshot() {
        let view = LoginView()
                    .frame(width: 375, height: 667)
        
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone8)))
    }
}
