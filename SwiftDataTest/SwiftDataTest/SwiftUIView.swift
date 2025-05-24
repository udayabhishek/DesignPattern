//
//  SwiftUIView.swift
//  SwiftDataTest
//
//  Created by Uday Abhishek on 24/04/25.
//

import SwiftUI
import SwiftData

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Notes.self)
    }
}
