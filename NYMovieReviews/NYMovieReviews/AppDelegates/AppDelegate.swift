//
//  AppDelegate.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        guard let window = window else { return true }
        window.makeKeyAndVisible()
        let navigationController = BaseNavigationController(rootViewController: MovieReviewViewController())
        window.rootViewController = navigationController
        return true
    }
}

