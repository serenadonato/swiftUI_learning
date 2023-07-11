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
            if let dataImage = presenter.dataDog {
                AsyncImage(url: URL(string: presenter.dataDog?.message ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                    case .failure(let error):
                        // Vista de error en caso de fallo en la carga de la imagen
                        Text("Error: \(error.localizedDescription)")
                    case .empty:
                        ProgressView()
                    @unknown default:
                        ProgressView()
                    }
                }
            }
            if let dataFact = presenter.dataDogFact {
                Text(presenter.dataDogFact?.data)
            }
            Button("Obtener lista de perros") {
                presenter.fetchDogImage()
                presenter.fetchDogFact()
            }
        }
        .onAppear {
            // Acciones a realizar cuando la vista aparece
            
            // Ejemplo: Cargar la lista de perros al aparecer la vista
            presenter.fetchDogImage()
            presenter.fetchDogFact()
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
