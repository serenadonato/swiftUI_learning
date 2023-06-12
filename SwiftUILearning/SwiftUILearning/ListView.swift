//
//  ListView.swift
//  SwiftUILearning
//
//  Created by Facundo Barboza on 12/06/2023.
//

import SwiftUI

struct ListView: View {
    
    var users = [
        User(id: 1, title: "Lucas Benitez", description: "iOS Developer - Créditos", avatar: Image(systemName: "checkmark.square.fill")),
        User(id: 2, title: "Francisco Saldivar", description: "iOS Dev - Loans(cuotis)", avatar: Image(systemName: "checkmark.square.fill")),
        User(id: 3, title: "Serena Donato", description: "iOS Developer | Créditos (Loans)", avatar: Image(systemName: "checkmark.square.fill")),
        User(id: 4, title: "Micaela Nuñez", description: "iOS Dev - Préstamos", avatar: Image(systemName: "checkmark.square.fill")),
        User(id: 5, title: "Facundo Barboza", description: "iOS Developer | Créditos", avatar: Image(systemName: "checkmark.square.fill"))
    ]
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                RowView(user: user)
            }
            .listStyle(.inset)
            .navigationTitle("Chikorita Learning")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
