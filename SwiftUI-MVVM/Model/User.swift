//
//  User.swift
//  SwiftUI-MVVM
//
//  Created by Ivo Huntjens on 19/08/2021.
//

import Foundation

struct User: Decodable {
    var email: String
    var name: Name
    var picture: Picture
    var country: String
    
    var countryEmoji: String {
        get {
            let base: UInt32 = 127397
            var scalarView = String.UnicodeScalarView()
            country.unicodeScalars.forEach {
                guard let scalar = UnicodeScalar(base + $0.value) else { return }
                scalarView.append(scalar)
            }
            
            return String(scalarView)
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case email
        case name
        case picture
        case country = "nat"
    }
}

extension User: Identifiable {
    var id: String { email }
}

struct Picture: Decodable {
    var medium: String
    var thumbnail: String
}

struct Name: Decodable {
    var title: String
    var firstName: String
    var lastName: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case firstName = "first"
        case lastName = "last"
    }
}
