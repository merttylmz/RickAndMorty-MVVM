//
//  CharacterViewController.swift
//  RickAndMorty-MVVM
//
//  Created by Mert Yılmaz on 9.09.2024.
//

import UIKit
import SnapKit

class CharacterViewController: UIViewController {

    private let characterListView = CharacterListView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupCharacterListView()
        /*Service.shared.execute(.listCharactersRequest, expecting: AllCharacterResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: " + String(model.info.count))
                print("Page result count: " + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
        */
        
    }
    
    func setupCharacterListView(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        title = "Character"

        view.addSubview(characterListView)
        // Constraints - characterListView
        characterListView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    


}
