//
//  UserDetailsRow.swift
//  Lab2
//
//  Created by Nemo on 01/06/2026.
//

import SwiftUI

struct UserDetailsRow: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
                .bold()
            Text(value)
                .font(.body)
        }
    }
}

struct UserDetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsRow(title: "test", value: "test")
    }
}
