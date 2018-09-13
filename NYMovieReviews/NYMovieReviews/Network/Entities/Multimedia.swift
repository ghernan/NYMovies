//
//  Multimedia.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

struct Multimedia: Codable {
    var imageLink: String
    
    enum CodingKeys: String, CodingKey {
        case imageLink = "src"
    }
}

extension Multimedia {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        imageLink = try values.decode(String.self, forKey: .imageLink) 
    }
}

