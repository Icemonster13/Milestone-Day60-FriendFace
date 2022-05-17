//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Michael & Diana Pascucci on 5/16/22.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    
    // MARK: - PROPERTIES
    @StateObject private var dataController = DataController()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
