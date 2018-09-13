//
//  BaseNavigationController.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.barTintColor = ThemeColor.Navigation.barTintColor
        self.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        self.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        self.navigationBar.tintColor = .white
    }
}
