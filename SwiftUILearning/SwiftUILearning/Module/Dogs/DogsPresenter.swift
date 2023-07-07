//
//  DogsPresenterProtocol.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 04/07/2023.

import Foundation
import Combine

protocol DogsPresenterProtocol: AnyObject, ObservableObject {
    func fetchDogList()
    func fetchDogDetails(withID id: String)
    var dataDog: Dog? { get }
    // Otras funciones relacionadas con acciones de la vista y comunicación con el Interactor
}

class DogsPresenter: DogsPresenterProtocol {
    var interactor: DogsInteractor
    var view: DogsViewProtocol?
    @Published var dataDog: Dog?
    
    init(interactor: DogsInteractor) {
        self.interactor = interactor
    }
    
    
    func fetchDogList() {
        interactor.fetchDogList { [weak self] result in
            switch result {
            case .success(let dogList):
                self?.dataDog = dogList
                print("Funciona")
            case .failure(let error):
                self?.view?.showError(error.localizedDescription)
            }
        }
    }
    
    func fetchDogDetails(withID id: String) {
        interactor.fetchDogDetails(withID: id) { [weak self] result in
            switch result {
            case .success(let dog):
                self?.view?.showDogDetails(dog)
            case .failure(let error):
                self?.view?.showError(error.localizedDescription)
            }
        }
    }
}

extension DogsPresenter {
    static func compose() -> DogsPresenter {
        let interactor = DogsInteractor.compose()
        return .init(interactor: interactor)
    }
}
