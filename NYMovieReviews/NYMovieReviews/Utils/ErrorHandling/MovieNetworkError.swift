//
//  MovieNetworkErrors.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

enum MovieNetworkError {
    case unavailableData
    case serverError
    case authenticationError
    case badRequest
    case outdated
    case noInternetConnection
    case failed
}

extension MovieNetworkError: NYMovieError {
    var errorDescription: String? {
        switch self {
        case .unavailableData:
            return NSLocalizedString("Data is unavailable", comment: "")
        case .serverError:
            return NSLocalizedString("Sorry, no response obtained", comment: "")
        case .authenticationError:
            return NSLocalizedString("Authentication error", comment: "")
        case .badRequest:
            return NSLocalizedString("Bad request", comment: "")
        case .outdated:
            return NSLocalizedString("Outdated response.", comment: "")
        case .noInternetConnection:
            return NSLocalizedString("No internet.", comment: "")
        case .failed:
            return NSLocalizedString("Communication failed.", comment: "")
        }
    }
    
    var failureReason: String? {
        switch self {
        case .unavailableData:
            return NSLocalizedString("No data found", comment: "")
        case .serverError:
            return NSLocalizedString("Server having issues.", comment: "")
        case .authenticationError:
            return NSLocalizedString("", comment: "")
        case .badRequest:
            return NSLocalizedString("Resources not found.", comment: "")
        case .outdated:
            return NSLocalizedString("", comment: "")
        case .noInternetConnection:
            return NSLocalizedString("Not connected to internet.", comment: "")
        case .failed:
            return NSLocalizedString("Unknown reason.", comment: "")
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .unavailableData:
            return NSLocalizedString("", comment: "")
        case .serverError:
            return NSLocalizedString("Please come back later, or try refreshing.", comment: "")
        case .authenticationError:
            return NSLocalizedString("Please refresh.", comment: "")
        case .badRequest:
            return NSLocalizedString("", comment: "")
        case .outdated:
            return NSLocalizedString("Please try refreshing.", comment: "")
        case .noInternetConnection:
            return NSLocalizedString("Please verify your connection.", comment: "")
        case .failed:
            return NSLocalizedString("Please try again later.", comment: "")
        }
    }
    
    static func validateStatusCode(statusCode: Int) -> MovieNetworkError? {
        switch statusCode {
        case 200...299:
            return nil
        case 401...500:
            return .authenticationError
        case 501...599:
            return .badRequest
        case 600:
            return .outdated
        case 1009:
            return .noInternetConnection
        default:
            return .failed
        }
    }
}
