//
//  PageInfoModel.swift
//  RickAndMortyAPIProject
//
//  Created by User on 15/11/22.
//

import Foundation

struct PageInfoModel: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?
}
