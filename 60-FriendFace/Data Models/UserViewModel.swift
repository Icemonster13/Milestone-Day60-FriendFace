//
//  UserViewModel.swift
//  60-FriendFace
//
//  Created by Michael & Diana Pascucci on 5/16/22.
//

import Foundation

//struct ArrayOfUser: Codable {
//    var users: [User]
//}

struct User: Identifiable, Codable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    static let exampleUser = User(id: UUID(),
                       isActive: true,
                       name: "Example User",
                       age: 50,
                       company: "Example Company",
                       email: "user@example.com",
                       address: "My Street, My Town, My State 12345",
                       about: "This is sample about data",
                       registered: Date.now,
                       tags: ["Tag 1", "Tag 2", "Tag 3"],
                       friends: [])
}
