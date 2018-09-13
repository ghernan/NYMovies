//
//  EndPointProtocol.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

protocol EndPointProtocol {
    var query: (path: String, params: [URLQueryItem]) { get }
    func asURLRequest() throws -> URLRequest
}
