//
//  DetailView.swift
//  SwiftUI-MVVM
//
//  Created by Ivo Huntjens on 19/08/2021.
//

import Foundation
import Combine
import SwiftUI

struct DetailView : View {
    var user: User
    
    var body: some View {
        HStack {
            Avatar(url: user.picture.thumbnail)
            VStack(alignment: .leading) {
                Text("\(user.name.firstName) \(user.name.lastName)")
                Text("\(user.email)")
                Text(user.countryEmoji)
            }
        }
    }
}

struct DetailView_Previews : PreviewProvider {
    static var previews: some View {
        DetailView(user: User(email: "example@example.com", name: Name(title: "mr", firstName: "Steven", lastName: "Robinson"), picture: Picture(medium: "", thumbnail: ""), country: "NL"))
    }
}
