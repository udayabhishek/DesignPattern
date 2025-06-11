//
//  SuccessView.swift
//  LoginTestApp
//
//  Created by Uday Abhishek on 11/06/25.
//

import SwiftUI

struct SuccessView: View {
    @Binding var username: String
    
    var body: some View {
        Text("Welcome \(username)")
            .font(.title)
    }
}
