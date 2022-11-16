//
//  CharacterViewModel.swift
//  RickAndMortyAPIProject
//
//  Created by User on 15/11/22.
//

import Foundation

class CharacterViewModel {
    
    // MARK: - Properties
    private var router: CharacterRouter!
    var characterService = CharacterService()
    var characters: [CharacterData] = [] {
        didSet { charactersDidChange?() }
    }
    var charactersDidChange: (() -> Void)?
    
    // MARK: - Init
    required init(router: CharacterRouter) {
        self.router = router
    }
    
    // MARK: - Functions
    func callCharacterList() {
        characterService.getCharacters { result, characters in
            switch result {
            case .success:
                if let characters = characters {
                    self.characters = characters
                }
            case .failure:
                self.router.showErrorFetchingDataAlert()
            }
        }
    }
}
