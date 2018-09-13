//
//  MovieReviewPresenter.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation
import UIKit

protocol MovieReviewPresenterProtocol: AnyObject {
    
    var reviews: [MovieReviewViewModel] { get }
    
    var nextPage: Int { get }
    
    func retrieveReviews(for page: Int)
    
    func showErrorAlert(with error: Error)
    
    var shouldReloadView: (([MovieReviewViewModel]) -> Void)? { get set }
    
    var selectedReview: MovieReviewViewModel? { get }
    
    func showDetails(for review: MovieReviewViewModel)
    
    func reloadFromEmpty()
    
}

class MovieReviewPresenter: BasePresenter<MovieReviewViewController>, MovieReviewPresenterProtocol {
    
    // MARK: - Public properties
    var reviews: [MovieReviewViewModel] = [] {
        didSet {
            guard let shouldReload = shouldReloadView else { return }
            shouldReload(reviews)
        }
    }
    
    var nextPage: Int {
        return reviews.count / 20
    }
    
    var selectedReview: MovieReviewViewModel? = nil
    
    var shouldReloadView: (([MovieReviewViewModel]) -> Void)?
    
    // MARK: - Private properties
    private let interactor = MovieReviewInteractor()
    
    // MARK: - Public functions
    func retrieveReviews(for page: Int = 0) {
        interactor.retrieveReviews(for: nextPage, success: { reviews in
            self.reviews.append(contentsOf: reviews)
        }, failure: { error in
            self.showErrorAlert(with: error)
        })
    }
    
    func reloadFromEmpty() {
        reviews = []
        retrieveReviews()
    }
    
    func showErrorAlert(with error: Error) {
        guard let viewController = viewController else { return }
        interactor.showErrorAlert(with: error, on: viewController)
    }
    
    func showDetails(for review: MovieReviewViewModel) {
        selectedReview = review
        guard let selectedReview = selectedReview, let viewController = viewController else { return }
        interactor.showDetails(for: selectedReview, in: viewController)
    }
}
