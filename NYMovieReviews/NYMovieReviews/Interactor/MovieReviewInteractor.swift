//
//  MovieReviewInteractor.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit

protocol MovieReviewInteractorProtocol {
    func retrieveReviews(for page: Int, success: @escaping ([MovieReviewViewModel]) -> Void, failure: @escaping (Error) -> Void)
    func showErrorAlert(with error: Error, on viewController: UIViewController)
    func showDetails(for review: MovieReviewViewModel, in viewController: MovieReviewViewController)
}

class MovieReviewInteractor: BaseInteractor, MovieReviewInteractorProtocol {
    
    // MARK: - Private properties
    private let manager = MovieReviewManager()
    private let wireFrame = Wireframe()
    
    // MARK: - Data management functions
    func retrieveReviews(for page: Int, success: @escaping ([MovieReviewViewModel]) -> Void, failure: @escaping (Error) -> Void) {
        manager.retrieveReviews(for: page, success: { reviews in
            success(MovieReviewViewModel.viewModelArray(from: reviews))
        }, failure: { error in
            failure(error)
        })
    }
    
    // MARK: - WireFrame functions
    func showErrorAlert(with error: Error, on viewController: UIViewController) {
        wireFrame.showErrorAlert(with: error, on: viewController)
    }
    
    func showDetails(for review: MovieReviewViewModel, in viewController: MovieReviewViewController) {
        guard let detailsController: ReviewDetailsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ReviewDetailsController.reusableIdentifier) as? ReviewDetailsController else { return }
        detailsController.review = review
        wireFrame.showReviewDetails(with: detailsController, in: viewController)
    }
}
