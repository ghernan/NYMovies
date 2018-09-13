//
//  ErrorShowable.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit

protocol ErrorShowable {
    func showErrorAlert(with error: Error, on viewController: UIViewController)
}

extension ErrorShowable {
    func showErrorAlert(with error: Error, on viewController: UIViewController) {
        let alert = AlertCreator.createErrorPopUp(with: error)
        viewController.present(alert, animated: true, completion: nil)
    }
}
