//
//  Request.swift
//  RickAndMorty-MVVM
//
//  Created by Mert Yılmaz on 10.09.2024.
//

import Foundation

//final kullanılarak miras alınması önlenmek istenmiştir - performans optimizasyonu arttırılmıştır
final class Request {
    // 1- base url
    // 2- endpoint
    // 3- path components
    // 4- query parameters
    // 5-
    //bu sırayla oluşturuldu.
    
    // private - constants yapısının içerisindeki baseUrl sabitinin sadece bu sınıfın içinde kullanılmasını sağladı.
    // static - bir kez bellekte tutarak tekrar oluşturmaz ve performansı arttırır.
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    
    // baseUrl + endpoint + pathCompanents + quertParameters
    
    
    // endpoint türü
    private let endpoint: Endpoint
    
    // path bileşenleri (örn: id)
    private let pathCompanents: [String]
    
    // URL sorgu parametreleri (örn: ?name=value)
    private let queryParameters: [URLQueryItem]
    
    // url kansdafjnsdag
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
            if !queryParameters.isEmpty {
                string += "?"
                let argumentString = queryParameters.compactMap ({
                    
                    guard let value = $0.value else {return nil}
                    return "\($0.name)=\(value)"
                    
                }).joined(separator: "&")
                
                string += argumentString
            }
        
        return string
    }
    
    
    // compactMap - arasına aldığı kodu opsiyonel değerlerden nil olmayanları döndürüp yeni koleksiyon oluşturur

    

    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"

    
    // MARK: - Public
    public init(endpoint: Endpoint, pathCompanents: [String]=[], queryParameters: [URLQueryItem]=[]) {
        self.endpoint = endpoint
        self.pathCompanents = pathCompanents
        self.queryParameters = queryParameters
    }
    
    // public init - sınıfın kullanılabilir olması ve farklı sınıflardan ya da modullerden kolayca erişim sağlanması
    // private - değişkenlerin yapısını korumak ve dışarıdan değiştirilmemesini sağlamak
    // bu ikili birlikte kullanılır. hem "GÜVENLİ" hem "MODÜLER" bir yapı oluşturmuş oluyoruz
}


extension Request {
    static let listCharactersRequest = Request(endpoint: .character)
}
