//
//  ListViewPresenter.swift
//  SwiftUILearning
//
//  Created by Facundo Barboza on 27/06/2023.
//

import Foundation

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
