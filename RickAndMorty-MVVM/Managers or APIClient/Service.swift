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
    
    public func execute(_ request: Request, completion: @escaping(Result<String,Error>)-> Void){
        
    }
}
