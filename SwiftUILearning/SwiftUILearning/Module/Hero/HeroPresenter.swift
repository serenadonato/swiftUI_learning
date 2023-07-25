//
//  HeroPresenter.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 25/07/2023.
//
import Foundation
import Combine

protocol HeroPresenterProtocol: AnyObject, ObservableObject {
    func fetchHeroImage()
    var dataHero: SuperHero? { get }
}

class HeroPresenter: HeroPresenterProtocol {
    var interactor: HeroInteractor
    var view: HeroViewProtocol?
    @Published var dataHero: SuperHero?
    
    init(interactor: HeroInteractor) {
        self.interactor = interactor
    }
    
    func fetchHeroImage() {
        interactor.fetchHeroImage { [weak self] result in
            switch result {
            case .success(let heroImage):
                self?.dataHero = heroImage
            case .failure(let error):
                self?.view?.showError(error.localizedDescription)
            }
        }
    }
}

extension HeroPresenter {
    static func compose() -> HeroPresenter {
        let interactor = HeroInteractor.compose()
        return .init(interactor: interactor)
    }
}
