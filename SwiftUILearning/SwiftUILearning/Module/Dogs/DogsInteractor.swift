//
//  DogsInteractor.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 04/07/2023.
//
import Alamofire
import Foundation

class DogsInteractor {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchDogImage(completion: @escaping (Result<Dog, Error>) -> Void) {
        let url = "https://dog.ceo/api/breeds/image/random"
        
        networkManager.getRequest(url: url, parameters: nil) { result in
            switch result {
            case .success(let data):
                // Parsea los datos JSON de la respuesta en un array de objetos Dog
                if let dogImage = try? JSONDecoder().decode(Dog.self, from: data) {
                    completion(.success(dogImage))
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
    
    func fetchDogFact(completion: @escaping (Result<DogFact, Error>) -> Void) {
        let url = "https://meowfacts.herokuapp.com/?count=1"
        
        networkManager.getRequest(url: url, parameters: nil) { result in
            switch result {
            case .success(let data):
                // Parsea los datos JSON de la respuesta en un array de objetos Dog
                if let dogFact = try? JSONDecoder().decode(DogFact.self, from: data) {
                    completion(.success(dogFact))
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
    
    func fetchDogDetails(withID id: String, completion: @escaping (Result<Dog, Error>) -> Void) {
        let url = "https://api.example.com/dogs/\(id)"
        
        networkManager.getRequest(url: url, parameters: nil) { result in
            switch result {
            case .success(let data):
                // Parsea los datos JSON de la respuesta en un objeto Dog
                if let dog = try? JSONDecoder().decode(Dog.self, from: data) {
                    completion(.success(dog))
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
    
    // Otras funciones relacionadas con perros, como crear un nuevo perro, actualizar información, eliminar, etc.
}

extension DogsInteractor {
    static func compose() -> DogsInteractor {
        let network = NetworkManager()
        return .init(networkManager: network)
    }
}

