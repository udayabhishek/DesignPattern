//
//  ContentView.swift
//  ToDoList
//
//  Created by Uday Abhishek on 29/05/25.
//

import SwiftUI
import SwiftData

//Adding Todo item as class to use with swiftdata,
@Model
class TodoItem {
    var title: String
    var isCompleted: Bool = false
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

struct TodoListView: View {
    /*@State var toDoItems = [ToDoItem(title: "buy groceries", isCompleted: false), ToDoItem(title: "service vehicle", isCompleted: true)]*/
   
    @Environment(\.modelContext) private var context
    @Query private var todo: [TodoItem]
    @State private var newToDoItem = ""
    
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
                    ForEach(todo) { toDoItem in
                        ToDoRowViewPer(todo: toDoItem)
                    }
                }
            }.navigationTitle("To-do List using persistent storage")
        }
    }
    
    func addToDoItem() {
//        todo.append(ToDoItem(title: newToDoItem))
        let newTodo = TodoItem(title: newToDoItem)
        context.insert(newTodo)
        newToDoItem = ""
    }
    
    func deleteToDoItem(at indexSet: IndexSet) {
//        todo.remove(atOffsets: indexSet)
        
        for index in indexSet {
            let todoToDelete = todo[index]
            context.delete(todoToDelete)
        }
    }
}

#Preview {
    ContentView()
}

struct ToDoRowViewPer: View {
//    @Binding var todo: ToDoItem
    @Environment(\.modelContext) private var context
    @Bindable var todo: TodoItem
    
    var body: some View {
        Toggle(isOn: $todo.isCompleted) {
            Text(todo.title)
                .strikethrough(todo.isCompleted, color: .gray)
                .foregroundColor(todo.isCompleted ? .gray : .primary)
        }
        .onChange(of: todo.isCompleted) { _ in
            try? context.save()
        }
    }
}
