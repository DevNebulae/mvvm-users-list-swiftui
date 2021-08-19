//
//  UserAPI.swift
//  SwiftUI-MVVM
//
//  Created by Ivo Huntjens on 19/08/2021.
//

import Combine
import Foundation

class UserAPI {
    private let decoder = JSONDecoder()
    private let session = URLSession.shared
    private let url = URL(string: "https://randomuser.me/api/1.2?results=50&exc=login,registered,id&seed=isaac")!
    
    func fetchUsers() -> AnyPublisher<UserResponse, Error> {
        session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: UserResponse.self, decoder: decoder)
            .mapError { error in
                print(error)
                return error
            }
            .eraseToAnyPublisher()
    }
}
