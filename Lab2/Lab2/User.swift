//
//  User.swift
//  Lab2
//
//  Created by Nemo on 01/06/2026.
//

import Foundation
// conferm the list the identifier

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
}
