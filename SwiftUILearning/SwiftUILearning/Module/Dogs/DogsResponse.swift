//
//  DogsResponse.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 04/07/2023.
//

struct Dog: Codable {
    let message: String
    let status: String
}

struct DogFact: Codable {
    let data: [String]
}

