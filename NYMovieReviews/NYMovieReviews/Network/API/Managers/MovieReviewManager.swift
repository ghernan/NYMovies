//
//  MovieReviewManager.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

protocol MovieReviewManagerProtocol: LocatableManager {
    func retrieveReviews(for page: Int, success: @escaping ([MovieReview]) -> Void, failure: @escaping (Error) -> Void)
}

class MovieReviewManager: BaseManager<MovieResponse> , MovieReviewManagerProtocol {
    private let service = MovieReviewService()
    func retrieveReviews(for page: Int, success: @escaping ([MovieReview]) -> Void, failure: @escaping (Error) -> Void) {
        service.retrieveReviews(for: page,success: { data in
            do {
                let movieResponse = try self.decode(data)
                let reviews = movieResponse.reviews
                success(reviews)
            } catch {
                failure(CodingError.unableToDecode)
            }
        }, failure: { error in
            failure(error)
        })
    }
}
