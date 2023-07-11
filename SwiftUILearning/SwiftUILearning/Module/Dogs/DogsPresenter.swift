//
//  DogsPresenterProtocol.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 04/07/2023.

import Foundation
import Combine

protocol DogsPresenterProtocol: AnyObject, ObservableObject {
    func fetchDogImage()
    func fetchDogDetails(withID id: String)
    func fetchDogFact() 
    var dataDog: Dog? { get }
    var dataDogFact: DogFact? { get }
    // Otras funciones relacionadas con acciones de la vista y comunicación con el Interactor
}

class DogsPresenter: DogsPresenterProtocol {
    var interactor: DogsInteractor
    var view: DogsViewProtocol?
    @Published var dataDog: Dog?
    @Published var dataDogFact: DogFact?
    
    init(interactor: DogsInteractor) {
        self.interactor = interactor
    }
    
    
    func fetchDogImage() {
        interactor.fetchDogImage { [weak self] result in
            switch result {
            case .success(let dogImage):
                self?.dataDog = dogImage
            case .failure(let error):
                self?.view?.showError(error.localizedDescription)
            }
        }
    }
    
    func fetchDogFact() {
        interactor.fetchDogFact { [weak self] result in
            switch result {
            case .success(let dogFact):
                self?.dataDogFact = dogFact
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
