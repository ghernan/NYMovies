//
//  MoviesEndpointRouter.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

enum MoviesEndpointRouter {
    case reviews(forPage: Int)
}

extension MoviesEndpointRouter: EndPointProtocol {
    var query: (path: String, params: [URLQueryItem]) {
        switch self {
        case .reviews(let page):
            return ("reviews/dvd-picks.json", [URLQueryItem(name: MovieConstants.Network.EndPoints.Params.key, value: NYMoviesAPI.apiKey),
                                                URLQueryItem(name: MovieConstants.Network.EndPoints.Params.page, value: "\(page)")])
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var baseURLComponents = URLComponents(string: NYMoviesAPI.baseURL+query.path)
        baseURLComponents?.queryItems = query.params
        guard let baseUrl = baseURLComponents?.url else { throw URLError(.badURL)}
        let urlRequest = URLRequest(url: baseUrl)
        return urlRequest
    }
}
