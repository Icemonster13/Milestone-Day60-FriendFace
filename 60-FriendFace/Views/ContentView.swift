//
//  ContentView.swift
//  60-FriendFace
//
//  Created by Michael & Diana Pascucci on 5/16/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    HStack {
                        Text(user.isActive ? "🟢" : "🔴")
                        Text(user.name)
                    }
                    .font(.headline)
                }
            }
            .navigationTitle("😁 FriendFace")
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Download failed")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
