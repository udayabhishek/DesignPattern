//
//  SuccessViewTests.swift
//  LoginAppTests
//
//  Created by Uday Abhishek on 12/06/25.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import LoginApp

final class SuccessViewTests: XCTestCase {

    func testSuccessViewSnapshot() {
        var testUsername = "Uday"
        let binding = Binding<String>(
            get: { testUsername },
            set: { testUsername = $0 }
        )

        let view = SuccessView(username: binding)
            .frame(width: 300, height: 100) // Setting the fixed sizes for consistency

        assertSnapshot(of: view, as: .image(layout: .device(config: .iPhoneX)))
    }
}
