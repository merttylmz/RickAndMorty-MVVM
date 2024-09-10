//
//  CharacterViewController.swift
//  RickAndMorty-MVVM
//
//  Created by Mert Yılmaz on 9.09.2024.
//

import UIKit

class CharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Character"
        
        let request = Request(endpoint: .character)
        print(request.url)
    }
    


}
