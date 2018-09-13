//
//  MovieReviewViewController.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit

class MovieReviewViewController: BaseViewController {
    
    // MARK: - Private properties
    private var tableView: MovieReviewTableView!
    private var presenter: MovieReviewPresenter!
    
    // MARK: - Life Cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        preparePresenter()
        setUpSubscripts()
    }
    
    // MARK: - Private functions
    private func preparePresenter() {
        presenter = MovieReviewPresenter(with: self)
        presenter.retrieveReviews()
    }
    
    private func prepareTableView() {
        navigationItem.title = MovieConstants.Reviews.Table.title
        tableView = MovieReviewTableView(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: view.frame.height), style: .plain)
        view.addSubview(tableView)
    }
    
    private func setUpSubscripts() {
        tableViewSubscripts()
        presenterSubscripts()
    }
    
    private func tableViewSubscripts() {
        
        tableView.shouldLoadNextPage = {
            self.presenter.retrieveReviews()
        }
        tableView.didSelectReview = { review in
            DispatchQueue.main.async {
                self.presenter.showDetails(for: review)
            }
        }
        tableView.willRefreshTable = {
            self.presenter.reloadFromEmpty()
        }
    }
    
    private func presenterSubscripts() {
        presenter.shouldReloadView = { reviews in
            DispatchQueue.main.async {
                self.tableView.reviews = reviews
            }
        }
    }
}
