//
//  BasePresenter.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit

protocol BasePresenterProtocol: AnyObject {
    associatedtype ViewController: UIViewController
    var viewController: ViewController? { get }
    init (with viewController: ViewController)
}

class BasePresenter<ViewController: UIViewController>: BasePresenterProtocol {
    weak var viewController: ViewController?
    required init(with viewController: ViewController) {
        self.viewController = viewController
    }
}
