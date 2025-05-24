//
//  TaskView.swift
//  MyTaskSwiftUI
//
//  Created by Uday Abhishek on 19/05/25.
//

import SwiftUI

struct TaskView: View {
    @ObservedObject var taskViewModel: TaskViewModel = TaskViewModel()
    @State private var pickerFilter: [String] = ["Active", "Inactive"]
    @State private var defaultPickerSelectionItem: String = "Active"
    
    var body: some View {
        NavigationStack {
            Picker("title", selection: $defaultPickerSelectionItem) {
                ForEach(pickerFilter, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(.segmented)
                .onChange(of: defaultPickerSelectionItem) { task in
                    taskViewModel.getTasks(isActive: task == "Active")
                }
            List(taskViewModel.tasks, id: \.id) { task in
                VStack(alignment: .leading) {
                    Text(task.name).font(.title2)
                    HStack {
                        Text(task.description).font(.subheadline).lineLimit(1)
                        Spacer()
                        Text(task.finishedDate.formattedDate).font(.subheadline).lineLimit(1)
                    }
                }
                
            }.onAppear {
                taskViewModel.getTasks(isActive: true)
            }.listStyle(.grouped)
                .navigationTitle("Tasks")
        }
    }
}

#Preview {
    TaskView()
}
