//
//  CharacterViewController.swift
//  RickAndMortyAPIProject
//
//  Created by User on 14/11/22.
//

import UIKit

class CharacterViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var titleBackView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleBackView: UIView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var characterTableView: UITableView!
    
    // MARK: - Properties
    var router: CharacterRouter!
    var viewModel: CharacterViewModel!
    var characters: [CharacterData] = []
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        router = CharacterRouter(characterViewController: self)
        viewModel = CharacterViewModel(router: router)
        setupBindings()
        viewModel.callCharacterList()
        setupUI()
        configure(tableView: characterTableView)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Functions
    func setupUI() {
        
        titleLabel.text = "Rick And Morty"
        subtitleLabel.text = "Characters"
        
        titleBackView.backgroundColor = .cyan
        subtitleBackView.backgroundColor = .cyan
        
        titleBackView.layer.cornerRadius = 10
        subtitleBackView.layer.cornerRadius = 10
    }
    
    func setupBindings() {
        viewModel.charactersDidChange = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.characterTableView.reloadData()
            }
        }
    }
}
