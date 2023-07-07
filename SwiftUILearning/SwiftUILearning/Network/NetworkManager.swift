//
//  NetworkManager.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 04/07/2023.
//

import Alamofire
import SwiftUI
import Foundation

enum NetworkError: Error {
    case requestFailed
    case invalidData
    case authenticationError
    case notFound
    case serverError
    
    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return "La solicitud ha fallado. Por favor, inténtalo de nuevo más tarde."
        case .invalidData:
            return "Los datos recibidos de la API no son válidos."
        case .authenticationError:
            return "Error de autenticación. Por favor, inicia sesión nuevamente."
        case .notFound:
            return "No se ha encontrado el recurso solicitado en el servidor."
        case .serverError:
            return "Error interno del servidor. Por favor, inténtalo de nuevo más tarde."
        }
    }
}

class NetworkManager {
    // Método para realizar una solicitud GET
    func getRequest(url: String, parameters: [String: Any]?, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url, method: .get, parameters: parameters)
            .validate() // Opcional: validar la respuesta de la API
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    // Procesar el resultado exitoso y llamar al closure de finalización con los datos obtenidos
                    if let data = try? JSONSerialization.data(withJSONObject: value) {
                        completion(.success(data))
                    } else {
                        // Error al procesar los datos de la respuesta
                        completion(.failure(NetworkError.serverError))
                    }
                case .failure(let error):
                    // Error en la solicitud o respuesta de la API
                    completion(.failure(error))
                }
            }
    }

}
