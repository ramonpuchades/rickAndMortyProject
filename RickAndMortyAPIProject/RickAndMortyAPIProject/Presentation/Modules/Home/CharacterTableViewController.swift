//
//  CharacterTableViewController.swift
//  RickAndMortyAPIProject
//
//  Created by User on 15/11/22.
//

import UIKit

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configure(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
        
        cell.display(viewModel.characters[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "AdditionalCharacterInfoViewController", bundle: nil)
        let characterInfoVC = storyboard.instantiateViewController(withIdentifier: "AdditionalCharacterInfoViewController") as! AdditionalCharacterInfoViewController
        characterInfoVC.character = viewModel.characters[indexPath.row]
        navigationController?.pushViewController(characterInfoVC, animated: true)
    }
}
