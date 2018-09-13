//
//  WireFrame.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation
import UIKit

protocol WireframeProtocol {
    func showReviewDetails(with detailsController: ReviewDetailsController, in reviewController: MovieReviewViewController)
}

class Wireframe: WireframeProtocol {
    func showReviewDetails(with detailsController: ReviewDetailsController, in reviewController: MovieReviewViewController) {
        reviewController.navigationController?.pushViewController(detailsController, animated: true)
    }
}

extension Wireframe: ErrorShowable {
}
