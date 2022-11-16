//
//  CharacterRouter.swift
//  RickAndMortyAPIProject
//
//  Created by User on 15/11/22.
//

import UIKit

class CharacterRouter {
    
    // MARK: - Properties
    private weak var characterViewController: CharacterViewController?
    
    // MARK: - Init
    required init(characterViewController: CharacterViewController) {
        self.characterViewController = characterViewController
    }
    
    // MARK: - Functions
    func showErrorFetchingDataAlert() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CharacterViewController") as! CharacterViewController
        let alert = UIAlertController(title: "Error", message: "No se han podido obtener los datos del servidor", preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .cancel)
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
