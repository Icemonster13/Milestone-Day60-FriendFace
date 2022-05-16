//
//  FriendViewModel.swift
//  60-FriendFace
//
//  Created by Michael & Diana Pascucci on 5/16/22.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: UUID
    var name: String
}
