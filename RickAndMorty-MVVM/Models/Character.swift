//
//  Character.swift
//  RickAndMorty-MVVM
//
//  Created by Mert Yılmaz on 9.09.2024.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let spicies: String
    let type: String
    let gender: Gender
    let origin: Origin
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}


//enum kullanılma sebebi karakterin 3 farklı durumla sınırlı olmasıdır. ölü-diri-bilinmiyor
//hata riski azalır - jsondan değer beklenmez.
//kolay eşleme yapılır - okunabilirliği artar

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
    case genderless = "Genderless"
}

struct Origin: Codable {
    let name: String
    let url: String

}

struct CharacterLocation: Codable {
    let name: String
    let url: String

}
