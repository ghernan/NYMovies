//
//  MovieReviewViewModel.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

struct MovieReviewViewModel {
    
    var title: String
    var headline: String
    var dvdReleaseDate: String
    var imageURL: String
    var author: String
    var summary: String
    var articleLink: String
    var articleText: String

    init(with review: MovieReview) {
        title = review.title
        headline = review.headline
        dvdReleaseDate = "Released: \(review.dvdReleaseDate?.convertDateString(fromFormat: DateFormat.yyyy_mm_dd, toFormat: DateFormat.mmddyy) ?? "N A")" 
        imageURL = review.multimedia.imageLink
        author = review.author
        summary = review.summary
        articleLink = review.link.urlString
        articleText = review.link.linkText
    }
    
    static func viewModelArray(from reviews: [MovieReview]) -> [MovieReviewViewModel] {
        var result: [MovieReviewViewModel] = []
        result = reviews.compactMap { MovieReviewViewModel(with: $0) }
        return result
    }
}

