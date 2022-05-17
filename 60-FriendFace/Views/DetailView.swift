//
//  DetailView.swift
//  60-FriendFace
//
//  Created by Michael & Diana Pascucci on 5/16/22.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - PROPERTIES
    // Added for Day 61 challenge
    let user: CachedUser
    // Removed for Day 61 challenge
    // let user: User
    
    // MARK: - BODY
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    AboutRowView(title: "🗓 Age", info: "\(user.age)")
                    AboutRowView(title: "🗂 Company", info: "\(user.wrappedCompany)")
                    AboutRowView(title: "📨 Email", info: "\(user.wrappedEmail)")
                    AboutRowView(title: "✅ Registered", info: "\(user.wrappedRegistered.formatted(date: .abbreviated, time: .omitted))")
                }
            } header: {
                Text("General Information")
            }
            
            Section {
                Text("\(user.wrappedAddress.replacingOccurrences(of: ", ", with: "\n"))")
            } header: {
                Text("Address")
            }
            
            Section {
                Text("\(user.wrappedAbout)")
            } header: {
                Text("About")
            }
            
            Section {
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                }
            } header: {
                Text("Friends")
            }
        }
        .font(.footnote)
        .navigationTitle("\(user.wrappedName)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(user: User.exampleUser)
//    }
//}
