//
//  String+ConvertDateString.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

extension String {
    
    func convertDateString(fromFormat: String?, toFormat: String?) -> String? {
        
        let formatter = DateFormatter()
        formatter.dateFormat = fromFormat
        guard let date = formatter.date(from: self) else {
            return nil
        }
        formatter.dateFormat = toFormat
        return formatter.string(from: date)
    }
}
