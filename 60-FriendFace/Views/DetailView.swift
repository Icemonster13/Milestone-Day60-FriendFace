//
//  DetailView.swift
//  60-FriendFace
//
//  Created by Michael & Diana Pascucci on 5/16/22.
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    AboutRowView(title: "🗓 Age", info: "\(user.age)")
                    AboutRowView(title: "🗂 Company", info: "\(user.company)")
                    AboutRowView(title: "📨 Email", info: "\(user.email)")
                    AboutRowView(title: "✅ Registered", info: "\(user.registered.formatted(date: .abbreviated, time: .omitted))")
                }
            } header: {
                Text("General Information")
            }
            
            Section {
                Text("\(user.address.replacingOccurrences(of: ", ", with: "\n"))")
            } header: {
                Text("Address")
            }
            
            Section {
                Text("\(user.about)")
            } header: {
                Text("About")
            }
            
            Section {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            } header: {
                Text("Friends")
            }
        }
        .font(.footnote)
        .navigationTitle("\(user.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User.exampleUser)
    }
}
