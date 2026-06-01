//
//  ContentView.swift
//  Lab2
//
//  Created by Nemo on 01/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(users)
            { item in
                NavigationLink {
                    UserDetailView(user: item)
                } label: {
                    UserRow(user: item)
                }.navigationTitle("Users")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
