//
//  Avatar.swift
//  SwiftUI-MVVM
//
//  Created by Ivo Huntjens on 19/08/2021.
//

import Foundation
import SwiftUI

struct Avatar : View {
    var url: String
    private let size: CGFloat = 56
    
    var body: some View {
        AsyncImage(url: URL(string: url)!, image: { Image(uiImage: $0).resizable() }) {
            Text("Loading...")
        }
        .clipShape(Circle())
        .frame(width: size, height: size, alignment: .center)
    }
}
