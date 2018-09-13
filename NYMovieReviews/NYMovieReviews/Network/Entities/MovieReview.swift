//
//  MovieReview.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

struct MovieReview: Codable {
    var title: String
    var headline: String
    var dvdReleaseDate: String?
    var multimedia: Multimedia
    var author: String
    var summary: String
    var link: Link
    
    enum CodingKeys: String, CodingKey {
        case title = "display_title"
        case headline = "headline"
        case dvdReleaseDate = "opening_date"
        case multimedia = "multimedia"
        case author = "byline"
        case summary = "summary_short"
        case link = "link"
    }
}

extension MovieReview {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        dvdReleaseDate = try values.decodeIfPresent(String.self, forKey: .dvdReleaseDate)
        headline = try values.decode(String.self, forKey: .headline)
        multimedia = try values.decode(Multimedia.self, forKey: .multimedia)
        author = try values.decode(String.self, forKey: .author)
        summary =  try values.decode(String.self, forKey: .summary)
        link = try values.decode(Link.self, forKey: .link)
    }
}

