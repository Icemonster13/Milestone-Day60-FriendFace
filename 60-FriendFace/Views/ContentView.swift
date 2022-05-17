//
//  ContentView.swift
//  60-FriendFace
//
//  Created by Michael & Diana Pascucci on 5/16/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    // Added for Day 61 challenge
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users: FetchedResults<CachedUser>
    // Removed for Day 61 challenge
    // @StateObject private var users = [User]()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    HStack {
                        Text(user.isActive ? "🟢" : "🔴")
                        Text(user.wrappedName)
                    }
                    .font(.headline)
                }
            }
            .navigationTitle("😁 FriendFace")
            .task {
                // await loadData()
            }
        }
    }
    
    // MARK: - METHODS
    
    // Retrieve data from internet and add it using the Data Models
    func loadData() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let users = try decoder.decode([User].self, from: data)
            
            // Added for Day 61 challenge
            await MainActor.run {
                updateCache(with: users)
            }
        } catch {
            print("Download failed")
        }
    }
    
    // Added for Day 61 challenge
    // Utilize the data retrieved from the internet and push it to Core Data for offline access
    func updateCache(with downloadedUsers: [User]) {
        for user in downloadedUsers {
            let cachedUser = CachedUser(context: moc)
            
            cachedUser.id = user.id
            cachedUser.isActive = user.isActive
            cachedUser.name = user.name
            cachedUser.age = Int16(user.age)
            cachedUser.company = user.company
            cachedUser.email = user.email
            cachedUser.address = user.address
            cachedUser.about = user.about
            cachedUser.registered = user.registered
            cachedUser.tags = user.tags.joined(separator: ",")
            
            for friend in user.friends {
                let cachedFriend = CachedFriend(context: moc)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                
                cachedUser.addToFriends(cachedFriend)
            }
        }
        try? moc.save()
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
