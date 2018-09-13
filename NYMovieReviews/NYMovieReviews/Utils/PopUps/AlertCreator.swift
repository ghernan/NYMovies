//
//  AlertCreator.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit

struct AlertCreator {
    
    static func createErrorPopUp(with error: Error) -> UIAlertController {
        let title = error.localizedDescription
        var reason = ""
        var suggestion = ""
        if let error = error as? LocalizedError {
            reason = error.failureReason ?? reason
            suggestion = error.recoverySuggestion ?? suggestion
        }
        let message = "\(reason) \(suggestion)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
}
