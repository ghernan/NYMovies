//
//  Link.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

struct Link: Codable {
    
    var urlString: String
    var linkText: String
    
    enum CodingKeys: String, CodingKey {
        case urlString = "url"
        case linkText = "suggested_link_text"
    }
}

extension Link {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        urlString = try values.decode(String.self, forKey: .urlString)
        linkText = try values.decode(String.self, forKey: .linkText)
    }
}
