//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Ivo Huntjens on 19/08/2021.
//

import Combine
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    UserRow(user: user)
                }
            }.navigationTitle("Users")
        }.onAppear {
            viewModel.fetchUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
