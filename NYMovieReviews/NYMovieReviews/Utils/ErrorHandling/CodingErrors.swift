//
//  CodingErrors.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

enum CodingError {
    case unableToDecode
}

extension CodingError: NYMovieError {
    
}
