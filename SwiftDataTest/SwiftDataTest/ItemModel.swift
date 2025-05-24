//
//  ItemModel.swift
//  SwiftDataTest
//
//  Created by Uday Abhishek on 24/04/25.
//

import Foundation
import SwiftData

@Model
class Notes {
    var title: String
    var createdAt: Date
    
    init(title: String, createdAt: Date = .now) {
        self.title = title
        self.createdAt = createdAt
    }
}
