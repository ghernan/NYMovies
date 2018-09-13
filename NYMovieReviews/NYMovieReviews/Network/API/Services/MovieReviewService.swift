//
//  MovieReviewService.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

protocol MovieReviewServiceProtocol {
    func retrieveReviews(for page: Int, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void)
}

class MovieReviewService: BaseService<MoviesEndpointRouter>, MovieReviewServiceProtocol {
    func retrieveReviews(for page: Int, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) {
        request(.reviews(forPage: page), success: { data in success(data) }, failure: { error in failure(error) })
    }
}
