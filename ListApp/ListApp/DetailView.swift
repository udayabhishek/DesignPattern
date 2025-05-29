//
//  DetailView.swift
//  ListApp
//
//  Created by Uday Abhishek on 28/05/25.
//

import SwiftUI

struct DetailView: View {
    let item: ListItems
    
    var body: some View {
        VStack {
            Text(item.title)
                .font(.headline)
            Text(item.description)
                .font(.body)
                .padding()
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

