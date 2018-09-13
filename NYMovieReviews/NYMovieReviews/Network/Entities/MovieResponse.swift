//
//  MovieResponse.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
    
    var reviews: [MovieReview]
    
    enum CodingKeys: String, CodingKey {
        case reviews = "results"
    }
    
}

extension MovieResponse {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reviews = try values.decode([MovieReview].self, forKey: .reviews)
    }
}

