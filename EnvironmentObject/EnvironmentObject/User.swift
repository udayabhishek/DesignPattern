//
//  User.swift
//  EnvironmentObject
//
//  Created by Uday Abhishek on 09/04/25.
//

import SwiftUI

class User: ObservableObject {
    @Published var name: String = "Vandy"
}

class Account: ObservableObject {
    @Published var balance: Double = 0.0
}
