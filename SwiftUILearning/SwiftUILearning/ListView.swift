//
//  ListView.swift
//  SwiftUILearning
//
//  Created by Facundo Barboza on 12/06/2023.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var presenter = ListViewPresenter()
    
    var body: some View {
        NavigationView {
            VStack {
                List(presenter.viewModel.users, id: \.id) { user in
                    NavigationLink(destination: DetailsView(user: user)) {
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
        ListView()
    }
}

class ListViewPresenter: ObservableObject {
    @Published var viewModel = ListViewModel()
    
    func fetchData() {
        viewModel.users = [
            User(id: 1, title: "Lucas Benitez", description: "Android - Créditos", avatar: "Mask"),
            User(id: 2, title: "Francisco Saldivar", description: "iOS Dev - Loans(cuotis)", avatar: "Mask"),
            User(id: 3, title: "Serena Donato", description: "iOS Developer | Créditos (Loans)", avatar: "Mask"),
            User(id: 4, title: "Micaela Nuñez", description: "iOS Dev - Préstamos", avatar: "Mask"),
            User(id: 5, title: "Facundo Barboza", description: "iOS Developer | Créditos", avatar: "Mask")
        ]
    }
    
    func refreshData() {
        viewModel.users = [User(id: 5, title: "Facundo Barboza", description: "iOS Developer | Créditos", avatar: "Mask")]
    }
}

struct ListViewModel {
    var users: [User] = []
}

struct ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if viewDidLoad == false {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}

extension View {
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
