//
//  UserRow.swift
//  SwiftUI-MVVM
//
//  Created by Ivo Huntjens on 19/08/2021.
//

import SwiftUI

struct UserRow: View {
    var user: User
    
    var body: some View {
        HStack {
            Avatar(url: user.picture.thumbnail)
            Text("\(user.name.firstName) \(user.name.lastName)")
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: User(email: "example@example.com", name: Name(title: "mr", firstName: "Steven", lastName: "Robinson"), picture: Picture(medium: "", thumbnail: ""), country: "DE"))
    }
}
