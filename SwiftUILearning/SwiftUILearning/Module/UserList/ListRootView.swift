//
//  ListView.swift
//  SwiftUILearning
//
//  Created by Facundo Barboza on 12/06/2023.
//

import SwiftUI

struct ListRootView: View {
    
    @ObservedObject var presenter = ListViewPresenter()
    
    var body: some View {
        NavigationView {
            VStack {
                List(presenter.viewModel.users, id: \.id) { user in
                    NavigationLink(destination: DetailsRootView(user: user)) {
                        RowView(user: user)
                    }
                }
                .listStyle(.inset)
                Button("Refresh") {
                    presenter.refreshData()
                }
                .onViewDidLoad {
                    presenter.fetchData()
                }
            }
            .navigationTitle("Chikorita Learning")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListRootView()
    }
}
