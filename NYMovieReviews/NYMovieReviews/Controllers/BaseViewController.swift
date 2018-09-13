//
//  BaseViewController.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    public static var reusableIdentifier: String {
        return String(describing: self)
    }
}
