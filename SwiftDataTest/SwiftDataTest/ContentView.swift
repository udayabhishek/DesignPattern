//
//  ContentView.swift
//  SwiftDataTest
//
//  Created by Uday Abhishek on 24/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var notes: [Notes]
    @State private var newNoteTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter note title", text: $newNoteTitle)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Add Note") {
                    let note = Notes(title: newNoteTitle)
                    context.insert(note)
                    newNoteTitle = ""
                }
                
                List {
                    ForEach(notes) { note in
                        VStack(alignment: .leading) {
                            Text(note.title)
                            Text(note.createdAt, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            
                        }
                        
                    }
                    .onDelete(perform: deleteNotes)
                }
            }
            .navigationTitle("My Notes")
        }
    }

    private func addItem() {
        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
        }
    }

    private func deleteNotes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                context.delete(notes[index])
            }
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
