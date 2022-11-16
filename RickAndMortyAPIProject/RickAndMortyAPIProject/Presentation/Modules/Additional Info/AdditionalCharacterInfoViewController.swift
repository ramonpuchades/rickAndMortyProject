//
//  AdditionalCharacterInfoViewController.swift
//  RickAndMortyAPIProject
//
//  Created by User on 16/11/22.
//

import UIKit
import AlamofireImage

class AdditionalCharacterInfoViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var lastLocationLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var imageBackView: UIView!
    
    // MARK: - Properties
    var router: AdditionalCharacterInfoRouter!
    var viewModel: AdditionalCharacterInfoViewModel!
    var character: CharacterData?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        router = AdditionalCharacterInfoRouter(additionalCharacterInfoViewController: self)
        viewModel = AdditionalCharacterInfoViewModel(router: router)
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backItem?.title = ""
        navigationItem.hidesBackButton = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = false
        guard let character = character else {
            return
        }
        setupUI(character)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - Functions
    func setupUI(_ info: CharacterData) {
        titleLabel.text = "Additional Character Info"
        
        imageBackView.layer.cornerRadius = 10
        imageBackView.backgroundColor = .cyan.withAlphaComponent(0.6)
        
        characterImageView.layer.cornerRadius = 10
        guard let imageUrl = character?.image else { return }
        guard let url = URL(string: imageUrl) else { return }
        characterImageView.af.setImage(withURL: url)
        
        guard let origin = character?.origin.name else { return }
        originLabel.text = "Comes from \(origin)"
        
        guard let lastSeen = character?.location.name else { return }
        lastLocationLabel.text = "Last seen: \(lastSeen)"
        
        guard let episodeCount = character?.episode?.count else { return }
        guard let characterName = character?.name else { return }
        episodesLabel.text = "\(characterName) appears in \(episodeCount) episodes."
        
        // Date Formatter
        guard let dateCharacter = character?.created else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from: dateCharacter)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let resultDate = dateFormatter.string(from: date!)
        createdLabel.text = "Created on \(resultDate)"
    }
}
