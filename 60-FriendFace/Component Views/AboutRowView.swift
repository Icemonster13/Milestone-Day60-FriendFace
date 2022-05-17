//
//  AboutRowView.swift
//  60-FriendFace
//
//  Created by Michael & Diana Pascucci on 5/16/22.
//

import SwiftUI

struct AboutRowView: View {
    var title: String
    var info: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.vertical, 1)
            Spacer()
            Text(info)
        }
    }
}

struct AboutRowView_Previews: PreviewProvider {
    static var previews: some View {
        AboutRowView(title: "Email", info: "myemail@server.com")
            .frame(width: 300)
            .previewLayout(.sizeThatFits)
    }
}
