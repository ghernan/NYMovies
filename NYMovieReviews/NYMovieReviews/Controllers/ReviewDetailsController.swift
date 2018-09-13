//
//  ReviewDetailsController.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit
import WebKit

class ReviewDetailsController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: CachedImageView!
    @IBOutlet weak var headLineLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var webLinkButton: UIButton!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    // MARK: - Public Properties
    var review: MovieReviewViewModel?
    
    // MARK: - Life Cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.setUpComponents()
            }
    }
    
    // MARK: - Private functions
    private func setUpComponents() {
        guard let review = self.review else { return }
        navigationItem.title = MovieConstants.Reviews.Details.title
        titleLabel.text = review.title
        releaseDateLabel.text = review.dvdReleaseDate
        headLineLabel.text = review.headline
        authorLabel.text = review.author
        summaryLabel.text = review.summary
        webLinkButton.setTitle(review.articleText, for: .normal)
        webLinkButton.titleLabel?.numberOfLines = 0
        webLinkButton.titleLabel?.textAlignment = .center
        imageView.loadImage(urlString: review.imageURL)
    }
    
    // MARK: - IBActions
    @IBAction func goToWebPage(_ sender: UIButton) {
        guard let review = self.review else { return }
        let webPageController = WebPageController()
        webPageController.urlReviewString = review.articleLink
        navigationController?.pushViewController(webPageController, animated: true)
    }
    
}
