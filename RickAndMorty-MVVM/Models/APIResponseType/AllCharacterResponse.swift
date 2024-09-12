//
//  AllCharacterResponse.swift
//  RickAndMorty-MVVM
//
//  Created by Mert Yılmaz on 12.09.2024.
//

import Foundation

struct AllCharacterResponse: Codable {
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info 
    let results: [Character]
}
