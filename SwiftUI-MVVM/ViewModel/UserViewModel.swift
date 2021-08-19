//
//  UserViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Ivo Huntjens on 19/08/2021.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var users = [User]()
    
    private let api = UserAPI()
    
    func fetchUsers() {
        api.fetchUsers()
            .map(\.results)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: &$users)
    }
}
