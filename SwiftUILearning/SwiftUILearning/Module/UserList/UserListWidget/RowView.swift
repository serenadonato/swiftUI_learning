//
//  RowView.swift
//  SwiftUILearning
//
//  Created by Facundo Barboza on 12/06/2023.
//

import SwiftUI

struct RowView: View {
    
    var user: User
    
    var body: some View {
        HStack{
            CheckRectangleView(avatar: user.avatar)
            VStack(alignment: .leading){
                Text(user.title).font(.title3)
                Text(user.description).font(.subheadline)
            }
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(user: User(id: 1, title: "Title", description: "Description", avatar: "Mask"))
    }
}
