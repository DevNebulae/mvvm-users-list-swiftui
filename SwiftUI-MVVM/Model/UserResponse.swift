//
//  UserResponse.swift
//  SwiftUI-MVVM
//
//  Created by Ivo Huntjens on 19/08/2021.
//

import Foundation

struct UserResponse: Decodable {
    var results: [User]
}
