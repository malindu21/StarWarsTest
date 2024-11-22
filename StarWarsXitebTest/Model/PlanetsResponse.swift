//
//  PlanetsResponse.swift
//  StarWarsXitebTest
//
//  Created by Malinduk on 2024-11-22.
//

import Foundation

struct Planet: Codable, Identifiable {
    let id = UUID()
    let name: String
    let climate: String
    let orbitalPeriod: String
    let gravity: String
    enum CodingKeys: String, CodingKey { case name, climate
        case orbitalPeriod = "orbital_period"
        case gravity
    }
}

struct PlanetsResponse: Codable {
    let results: [Planet]
}
