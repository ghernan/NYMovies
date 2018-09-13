//
//  EmptyBackgroundView.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation
import UIKit

class EmptyBackgroundView: UIView {
    
    private var imageView: UIImageView!
    private var topLabel: UILabel!
    private var bottomLabel: UILabel!
    
    private let topColor = ThemeColor.Tables.Background.titleColor
    private let topFont = UIFont.boldSystemFont(ofSize: 18)
    private let bottomColor = ThemeColor.Tables.Background.detailColor
    private let bottomFont = UIFont.systemFont(ofSize: 14)
    
    private struct LayoutConstants {
        static let sideMargin: CGFloat = 40
        static let topMargin: CGFloat = 20
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    init(image: UIImage, top: String, bottom: String) {
        super.init(frame: .zero)
        setupViews()
        setupImageView(image: image)
        setupLabels(top: top, bottom: bottom)
    }
    
    func setupViews() {
        imageView = UIImageView()
        topLabel = UILabel()
        bottomLabel = UILabel()
        addSubview(imageView)
        addSubview(topLabel)
        addSubview(bottomLabel)
        self.backgroundColor = ThemeColor.Tables.Background.baseColor
    }
    
    func setupImageView(image: UIImage) {
        imageView.image = image
        imageView.alpha = 0.35
        imageView.tintColor = topColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLabels(top: String, bottom: String) {
        topLabel.text = top
        topLabel.textColor = topColor
        topLabel.font = topFont
        topLabel.textAlignment = .center
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = bottom
        bottomLabel.textColor = bottomColor
        bottomLabel.font = bottomFont
        bottomLabel.numberOfLines = 0
        bottomLabel.textAlignment = .center
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var allConstraints: [NSLayoutConstraint] = []
        let screenWidth = UIScreen.main.bounds.width
        let imageDiameter = screenWidth - LayoutConstants.sideMargin*2
        let metrics = ["diameter": imageDiameter,
                       "sideMargin": LayoutConstants.sideMargin]
        let views: [String: UIView] = ["image": imageView,
                                       "title": topLabel,
                                       "message": bottomLabel]
        let visualFormat = ["H:|-sideMargin-[image]-sideMargin-|",
                            "H:|-sideMargin-[title]-sideMargin-|",
                            "H:|-sideMargin-[message]-sideMargin-|",
                            "V:|-175-[image(diameter)]-30-[title(20)]-[message]"]
        for format in visualFormat {
            let constraint = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views)
            allConstraints += constraint
        }
        NSLayoutConstraint.activate(allConstraints)
    }
}
