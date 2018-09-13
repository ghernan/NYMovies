//
//  BaseManager.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

protocol BaseManagerProtocol: AnyObject {
    associatedtype Model: Decodable
    func decode(_ data: Data) throws -> Model
}

class BaseManager<Model: Decodable>: BaseManagerProtocol {
    
    private let jsonDecoder = JSONDecoder()
    
    func decode(_ data: Data) throws -> Model {
        return try jsonDecoder.decode(Model.self, from: data)
    }
}
