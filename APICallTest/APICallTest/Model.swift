//
//  Model.swift
//  APICallTest
//
//  Created by Uday Abhishek on 16/06/25.
//

import Foundation

struct Post: Identifiable, Decodable {
    let id: Int
    let title: String
}

struct User: Identifiable, Decodable {
    let id: Int
    let name: String
    let email: String
}
