//
//  CharacterTableViewCell.swift
//  RickAndMortyAPIProject
//
//  Created by User on 15/11/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    // MARK: - Properties
    
    
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Functions
    func display(_ character: CharacterData) {
        nameLabel.text = character.name
        
        guard let genderInfo = character.gender else { return }
        genderLabel.text = "Gender: \(genderInfo)"
        
        guard let statusInfo = character.status else { return }
        statusLabel.text = "Status: \(statusInfo)"
        
        guard let speciesInfo = character.species else { return }
        speciesLabel.text = "Species: \(speciesInfo)"
                
        idLabel.text = "ID: \(character.id!)"
    }
    
    func setupUI() {
        backView.layer.cornerRadius = 10
        backView.backgroundColor = .systemGreen.withAlphaComponent(0.6)
    }
}
