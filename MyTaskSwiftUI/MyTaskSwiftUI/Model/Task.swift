//
//  Task.swift
//  MyTaskSwiftUI
//
//  Created by Uday Abhishek on 19/05/25.
//

import Foundation

struct Task {
    let id: Int
    var name: String
    var description: String
    var isActive: Bool
    var finishedDate: Date

    static func createTask() -> [Task] {
       return [
            Task(id: 1, name: "Book reading", description: "Power of Now", isActive: true, finishedDate: Date()),
            Task(id: 2, name: "Go to gym", description: "Back Workout", isActive: false, finishedDate: Date()),
            Task(id: 3, name: "Order Groceries, buy for whole month today", description: "buy vegetables fefwefwefef werferer rwerwe r  rwe rwe r wer wer", isActive: true, finishedDate: Date()),
            Task(id: 4, name: "Call Teja", description: "Regading family", isActive: true, finishedDate: Date())
        ]
    }
}
