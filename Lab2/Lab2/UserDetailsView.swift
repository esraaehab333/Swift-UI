//
//  UserDetailsView.swift
//  Lab2
//
//  Created by Nemo on 01/06/2026.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    let imageUrl = URL(string: "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg")

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 120, height: 120)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                    case .failure:
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                   default:
                        EmptyView()
                    }
                }
                .padding(.top)
                VStack(alignment: .leading, spacing: 15) {
                    UserDetailsRow(title: "Full Name", value: user.name)
                    UserDetailsRow(title: "Username", value: user.username)
                    UserDetailsRow(title: "Email", value: user.email)
                    UserDetailsRow(title: "Phone", value: user.phone)
                    UserDetailsRow(title: "Website", value: user.website)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(12)
                .padding(.horizontal)
            }
        }
        .navigationTitle(user.name)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UserDetailView(
                user: User(
                    id: 1,
                    name: "Leanne Graham",
                    username: "Bret",
                    email: "Sincere@april.biz",
                    phone: "1-770-736-8031 x56442",
                    website: "hildegard.org"
                )
            )
        }
    }
}
