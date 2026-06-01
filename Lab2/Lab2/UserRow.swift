//
//  UserRow.swift
//  Lab2
//
//  Created by Nemo on 01/06/2026.
//

import SwiftUI

struct UserRow: View {
    let user: User
    let imageUrl = URL(string: "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg")
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView().frame(width: 40, height: 40)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                case .failure:
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
               default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(user.username)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
    }
}
