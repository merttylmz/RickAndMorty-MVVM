//
//  Location.swift
//  RickAndMorty-MVVM
//
//  Created by Mert Yılmaz on 9.09.2024.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
