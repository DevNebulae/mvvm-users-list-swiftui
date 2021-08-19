//
//  AsyncImage.swift
//  SwiftUI-MVVM
//
//  Created by Ivo Huntjens on 19/08/2021.
//

import Foundation
import SwiftUI

struct AsyncImage<Placeholder : View> : View {
    @StateObject private var loader: ImageLoader
    private let image: (UIImage) -> Image
    private let placeholder: Placeholder
    
    init(url: URL, @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:), @ViewBuilder placeholder: () -> Placeholder) {
        self.image = image
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url))
    }
    
    var body: some View {
        content.onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if let image = loader.image {
                self.image(image)
            } else {
                placeholder
            }
        }
    }
}
