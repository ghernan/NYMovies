//
//  MovieReviewCell.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit

class MovieReviewCell: BaseTableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var thumbnailImage: CachedImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styleComponents()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    }
    
    // MARK: - Private functions
    
    private func styleComponents() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
}
