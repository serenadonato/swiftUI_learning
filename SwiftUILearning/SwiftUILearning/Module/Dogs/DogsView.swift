//
//  DogsView.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 04/07/2023.
//

import SwiftUI
import Combine

protocol DogsViewProtocol {
    func showDogDetails(_ dog: Dog)
    func showError(_ message: String)
}

struct DogsView <Presenter: DogsPresenterProtocol>: View, DogsViewProtocol {
    @ObservedObject var presenter: Presenter
    
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            // Implementa la interfaz de usuario de tu vista
            Text("Lista de Perros")
            if let data = presenter.dataDog {
                AsyncImage(url: .init(string: data.message))
            }
            Button("Obtener lista de perros") {
                presenter.fetchDogList()
            }
        }
        .onAppear {
            // Acciones a realizar cuando la vista aparece
            
            // Ejemplo: Cargar la lista de perros al aparecer la vista
            presenter.fetchDogList()
        }
    }
    
    func showDogDetails(_ dog: Dog) {
        // Muestra los detalles del perro en la interfaz de usuario
    }
    
    func showError(_ message: String) {
        // Muestra un mensaje de error en la interfaz de usuario
    }
    
    // Otras funciones de la vista según las interacciones y acciones requeridas
}

extension DogsView {
    static func compose() -> DogsView<DogsPresenter> {
        let presenter = DogsPresenter.compose()
        let view = DogsView<DogsPresenter>.init(presenter: presenter)
        presenter.view = view
        return view
    }
}
