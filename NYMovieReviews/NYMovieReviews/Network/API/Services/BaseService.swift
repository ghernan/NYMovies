//
//  BaseService.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/12/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import Foundation

protocol BaseServiceProtocol: AnyObject {
    associatedtype EndPoint: EndPointProtocol
    func request(_ endPoint: EndPoint, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void )
}

class BaseService<EndPoint: EndPointProtocol>: BaseServiceProtocol {
    
    private var task = URLSessionDataTask()
    func request(_ endPoint: EndPoint, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) {
        let session = URLSession.shared
        do {
            let request = try endPoint.asURLRequest()
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                guard let data = data, let response = response as? HTTPURLResponse else {
                    failure(error ?? MovieNetworkError.unavailableData)
                    return
                }
                let possibleNetworkError = MovieNetworkError.validateStatusCode(statusCode: response.statusCode)
                switch possibleNetworkError {
                case nil:
                    success(data)
                default:
                    guard let error = possibleNetworkError else { break }
                    failure(error)
                }
            })
        }
        catch {
            failure(MovieNetworkError.badRequest)
        }
        task.resume()
    }
    
    func cancel() {
        task.cancel()
    }
}
