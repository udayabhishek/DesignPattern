//
//  date.swift
//  MyTaskSwiftUI
//
//  Created by Uday Abhishek on 19/05/25.
//

import Foundation

extension Date {
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
}
