//
//  MyTaskSwiftUIApp.swift
//  MyTaskSwiftUI
//
//  Created by Uday Abhishek on 19/05/25.
//

import SwiftUI
import SwiftData

@main
struct MyTaskSwiftUIApp: App {

    var body: some Scene {
        WindowGroup {
            TaskView()
        }
//        .modelContainer(sharedModelContainer)
    }
}
