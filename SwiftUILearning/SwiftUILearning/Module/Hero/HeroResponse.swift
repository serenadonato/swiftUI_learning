//
//  HeroResponse.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 25/07/2023.
//
struct SuperHero: Codable {
    let response: String
    let id: String
    let name: String
    let powerstats: Powerstats?
    let biography: Biography?
    let appearance: Appearance?
    let work: Work?
    let connections: Connections?
    let image: Image?
    let url: String
}

struct Powerstats: Codable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}

struct Biography: Codable {
    let fullName: String
    let alterEgos: String
    let aliases: [String]
    let placeOfBirth: String
    let firstAppearance: String
    let publisher: String
    let alignment: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case aliases, publisher, alignment
    }
}

struct Appearance: Codable {
    let gender: String
    let race: String
    let height: [String]
    let weight: [String]
    let eyeColor: String
    let hairColor: String

    enum CodingKeys: String, CodingKey {
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
        case gender, race, height, weight
    }
}

struct Work: Codable {
    let occupation: String
    let base: String
}

struct Connections: Codable {
    let groupAffiliation: String
    let relatives: String

    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
}

struct Image: Codable {
    let url: String
}

