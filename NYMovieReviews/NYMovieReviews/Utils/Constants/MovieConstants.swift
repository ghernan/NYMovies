//
//  MovieConstants.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

/*
 * This struct should be used to persist our constants through the application.
 */

struct MovieConstants {
    
    struct Network {
        struct EndPoints {
            struct Params {
                static let key = "api-key"
                static let page = "offset"
            }
        }
    }
    
    struct WireFrame {
        struct Segues {
            static let toReviewDetails = "toReviewDetailsController"
        }
    }
    
    struct Reviews {
        
        struct Table {
            static let title = "Reviews"
            static let emptyTitle = "No available reviews"
            static let emptyDetail = "Please try to refresh in a few moments."
            static let refreshTitle = "Pull to refresh"
        }
        struct Details {
            static let title = "Details"
        }
        struct Related {
            static let title = "Article"
        }
    }
}
