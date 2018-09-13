//
//  MovieReviewTableView.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation
import UIKit

class MovieReviewTableView: BaseTableView<MovieReviewCell>, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Public properties
    var reviews: [MovieReviewViewModel] = [] {
        didSet {
            resetTableview()
        }
    }
    
    var shouldLoadNextPage: (() -> Void)?
    
    var didSelectReview: ((MovieReviewViewModel) -> Void)?
    
    var willRefreshTable: (() -> Void)?
    
    // MARK: - Life cycle functions
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        setUp()
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funtions
    private func resetTableview() {
        self.reloadData()
        self.separatorStyle = reviews.count == 0 ? .none : .singleLine
        self.backgroundView?.isHidden = reviews.count != 0
        self.refreshControl?.endRefreshing()
    }
    
    private func setUp() {
        let emptyBackgroundView = EmptyBackgroundView(image: #imageLiteral(resourceName: "smile"), top: MovieConstants.Reviews.Table.emptyTitle, bottom: MovieConstants.Reviews.Table.emptyDetail)
        self.backgroundView = emptyBackgroundView
        self.tableFooterView = UIView()
        self.tableFooterView?.backgroundColor = .clear
        setUpRefreshControl()
    }
    
    private func setUpRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: MovieConstants.Reviews.Table.refreshTitle)
        refreshControl?.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
    }
    
    @objc private func refreshTable() {
        guard let willRefresh = willRefreshTable else { return }
        willRefresh()
    }
    
    // MARK: - DataSource functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let review = reviews[indexPath.row]
        let cell = dequeueCell(for: indexPath)
        cell.headlineLabel.text = review.headline
        cell.releaseDateLabel.text = review.dvdReleaseDate
        cell.titleLabel.text = review.title
        cell.thumbnailImage.loadImage(urlString: review.imageURL)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // MARK: - Delegate functions
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let didSelect = didSelectReview else { return }
        didSelect(reviews[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let shouldLoadNext = shouldLoadNextPage, (indexPath.row == reviews.count - 4) else { return }
        shouldLoadNext()
    }
}
