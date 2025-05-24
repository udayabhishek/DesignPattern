//
//  Untitled.swift
//  ObservableObject
//
//  Created by Uday Abhishek on 09/04/25.
//

import SwiftUI

struct STUser {
    var name: String = ""
}

class CLUser: ObservableObject {
    @Published var name: String = String()
}
