//
//  DetailsView.swift
//  SwiftUILearning
//
//  Created by Facundo Barboza on 22/06/2023.
//

import SwiftUI

struct DetailsRootView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                //CheckRectangleView(avatar: user.avatar)
                 //   .padding(.trailing, 5)
                Text(user.description)
                    .font(.title2)
                    .bold()
                Spacer()
            }
//            Text(user.description)
//                .padding(.top)
//            Spacer()
        }
        .padding()
        .navigationTitle(user.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsRootView(user: User(id: 1, title: "Test", description: "Description", avatar: "Mask"))
    }
}
