//
//  WebPageController.swift
//  NYMovieReviews
//
//  Created by Antonio  Hernandez  on 9/13/18.
//  Copyright © 2018 tonio. All rights reserved.
//

import UIKit
import WebKit

class WebPageController: BaseViewController {
    
    // MARK: - Public properties
    var urlReviewString: String!
    
    // MARK: - Private properties
    private var webView: WKWebView!
    private var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        loadURL()
    }
    
    // MARK: - Private functions
    private func loadURL() {
        guard let myURL = URL(string: self.urlReviewString) else { return }
        let myRequest = URLRequest(url: myURL)
        self.webView.load(myRequest)
    }
    
    private func setUpStyle() {
        navigationItem.title = MovieConstants.Reviews.Related.title
    }
    
    private func prepareActivityIndicator() {
        view.addSubview(activityIndicator)
        self.activityIndicator.startAnimating()
        webView.navigationDelegate = self
        activityIndicator.center = view.center
    }
}

extension WebPageController: WKUIDelegate, WKNavigationDelegate {
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        DispatchQueue.main.async {
            self.prepareActivityIndicator()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
}
