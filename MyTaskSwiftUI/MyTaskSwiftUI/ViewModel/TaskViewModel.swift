//
//  TaskViewModel.swift
//  MyTaskSwiftUI
//
//  Created by Uday Abhishek on 19/05/25.
//

import Foundation

final class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func getTasks(isActive: Bool) {
        tasks = Task.createTask().filter({$0.isActive == isActive})
    }
}
