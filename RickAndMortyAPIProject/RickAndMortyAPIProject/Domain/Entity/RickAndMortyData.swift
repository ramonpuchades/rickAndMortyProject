//
//  CharacterData.swift
//  RickAndMortyAPIProject
//
//  Created by User on 15/11/22.
//

import Foundation

struct RickAndMortyData: Codable {
    var info: PageInfoModel
    var results: [CharacterData]
}
