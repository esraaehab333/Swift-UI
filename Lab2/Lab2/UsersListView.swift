//
//  UsersListView.swift
//  Lab2
//
//  Created by Nemo on 01/06/2026.
//

import SwiftUI

import SwiftUI

struct UsersListView: View {
    @State private var users: [User] = []
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Loading Users...")
                } else if let errorMessage = errorMessage {
                    VStack(spacing: 12) {
                        Text(errorMessage)
                            .foregroundColor(.secondary)
                        Button("Try Again") {
                            Task { await fetchUsers() }
                        }
                        .buttonStyle(.bordered)
                    }
                } else {
                    List(users) { user in
                        // Clicking this row passes your specific model to the detail view
                        NavigationLink(destination: UserDetailView(user: user)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.name)
                                    .font(.headline)
                                Text("@\(user.username)")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                Text(user.email)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .task {
                await fetchUsers()
            }
        }
    }

    func fetchUsers() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // Decodes perfectly, ignoring 'address' and 'company' automatically
            let decodedUsers = try JSONDecoder().decode([User].self, from: data)
            
            await MainActor.run {
                self.users = decodedUsers
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
