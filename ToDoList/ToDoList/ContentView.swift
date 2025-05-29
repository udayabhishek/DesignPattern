//
//  ContentView.swift
//  ToDoList
//
//  Created by Uday Abhishek on 29/05/25.
//

import SwiftUI

struct ToDoItem: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct ContentView: View {
    @State var toDoItems = [ToDoItem(title: "buy groceries", isCompleted: false), ToDoItem(title: "service vehicle", isCompleted: true)]
    @State var newToDoItem = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack() {
                    TextField("Enter here", text: $newToDoItem)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    Button(action: addToDoItem) {
                        Image(systemName: "plus")
                            .padding()
                    }
                    .disabled(newToDoItem.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding(.top)
                
                List {
                    ForEach($toDoItems) { $toDoItem in
                        ToDoRowView(todo: $toDoItem)
                    }
                }
            }.navigationTitle("Todo List")
        }
    }
    
    func addToDoItem() {
        toDoItems.append(ToDoItem(title: newToDoItem))
        newToDoItem = ""
    }
    
    func deleteToDoItem(at indexSet: IndexSet) {
        toDoItems.remove(atOffsets: indexSet)
    }
}

#Preview {
    ContentView()
}

struct ToDoRowView: View {
    @Binding var todo: ToDoItem
    
    var body: some View {
        Toggle(isOn: $todo.isCompleted) {
            Text(todo.title)
                .strikethrough(todo.isCompleted, color: .gray)
                .foregroundColor(todo.isCompleted ? .gray : .primary)
        }
    }
}
