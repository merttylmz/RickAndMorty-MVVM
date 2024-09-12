//
//  Service.swift
//  RickAndMorty-MVVM
//
//  Created by Mert Yılmaz on 9.09.2024.
//

import Foundation

final class Service{
    
    //singleton
    static let shared = Service()
    private init(){ }
    
    enum ServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    
    
    // T codable protokolüne uygun hale getirilmiştir. T codable herhangi bir şey olabilir esneklik sağlanmıştır.
    public func execute<T:Codable>(_ request: Request,expecting type: T.Type, completion: @escaping(Result<T,Error>)-> Void){
        
        guard let urlRequest  = self.request(from: request) else {
            completion(.failure(ServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? ServiceError.failedToGetData))
                return
            }
            
            //decode
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
        
    }
    
    // MARK: - Private
    
    private func request(from request: Request) -> URLRequest? {
        
        guard let url = request.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = request.httpMethod
        
        return request
    }
}
