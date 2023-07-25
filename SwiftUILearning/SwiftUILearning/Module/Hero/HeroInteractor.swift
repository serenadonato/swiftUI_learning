//
//  HeroInteractor.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 25/07/2023.
//
import Alamofire
import Foundation

class HeroInteractor {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchHeroImage(completion: @escaping (Result<SuperHero, Error>) -> Void) {
        let randomFloat = Int.random(in: 1...731)
        let url = "https://superheroapi.com/api/6908752032469604/\(randomFloat)/image"
        
        networkManager.getRequest(url: url, parameters: nil) { result in
            switch result {
            case .success(let data):
                // Parsea los datos JSON de la respuesta en un array de objetos Dog
                if let heroImage = try? JSONDecoder().decode(SuperHero.self, from: data) {
                    completion(.success(heroImage))
                } else {
                    // Error al parsear los datos
                    completion(.failure(NetworkError.invalidData))
                }
            case .failure(let error):
                // Error en la solicitud o respuesta de la API
                completion(.failure(error))
            }
        }
    }
}

extension HeroInteractor {
    static func compose() -> HeroInteractor {
        let network = NetworkManager()
        return .init(networkManager: network)
    }
}


