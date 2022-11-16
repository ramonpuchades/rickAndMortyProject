//
//  CharacterModel.swift
//  RickAndMortyAPIProject
//
//  Created by User on 15/11/22.
//

import Foundation

struct CharacterData: Codable {
    var id: Int?
    var name: String?
    var gender: String?
    var status: String?
    var species: String?
    var image: String?
    var origin: OriginDTO
    var location: LocationDTO
    var episode: [String]?
    var created: String?
}
