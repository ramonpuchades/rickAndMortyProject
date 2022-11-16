//
//  AdditionalCharacterInfoRouter.swift
//  RickAndMortyAPIProject
//
//  Created by User on 16/11/22.
//

import UIKit

class AdditionalCharacterInfoRouter {
    
    
    // MARK: - Properties
    private weak var additionalCharacterInfoViewController: AdditionalCharacterInfoViewController?
    
    
    // MARK: - Init
    required init(additionalCharacterInfoViewController: AdditionalCharacterInfoViewController) {
        self.additionalCharacterInfoViewController = additionalCharacterInfoViewController
    }
    
    // MARK: - Functions
    func showErrorFetchingDataAlert() {
        let storyboard = UIStoryboard(name: "AdditionalCharacterInfoViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AdditionalCharacterInfoViewController") as! AdditionalCharacterInfoViewController
        let alert = UIAlertController(title: "Error", message: "No se han podido obtener los datos del servidor", preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .cancel)
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
