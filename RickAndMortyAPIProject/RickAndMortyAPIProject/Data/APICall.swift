//
//  APICall.swift
//  RickAndMortyAPIProject
//
//  Created by User on 15/11/22.
//

import Foundation

enum ApiResult {
    case success
    case failure
}

class CharacterService {
    func getCharacters(completion: @escaping (ApiResult, [CharacterData]?) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            completion(.failure, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure, nil)
            }
            let decoder = JSONDecoder()
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        guard let raw = data else {
                            completion(.failure, nil)
                            return
                        }
                        let character = try decoder.decode(RickAndMortyData.self, from: raw)
                        print("-----> Characters: \(character)")
                        completion(.success, character.results)
                    } catch let errorMessage {
                        print(errorMessage)
                        completion(.failure, nil)
                    }
                }
            } else {
                completion(.failure, nil)
            }
        }
        task.resume()
    }
}
