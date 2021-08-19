//
//  ImageLoader.swift
//  SwiftUI-MVVM
//
//  Created by Ivo Huntjens on 19/08/2021.
//

import Combine
import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellabe: AnyCancellable?
    private let url: URL
    
    init(_ url: URL) {
        self.url = url
    }
    
    deinit {
        cancel()
    }
    
    func cancel() {
        cancellabe?.cancel()
    }
    
    func load() {
        cancellabe = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
}
