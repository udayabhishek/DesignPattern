//
//  LoginUseCase.swift
//  LoginTestApp
//
//  Created by Uday Abhishek on 11/06/25.
//

import Foundation
import Combine

class LoginUseCase {
    func execute(username: String, password: String) -> AnyPublisher<Bool, Error> {
        // Simulating network delay delay
        Just(true)
            .delay(for: .seconds(2), scheduler: DispatchQueue.main)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

