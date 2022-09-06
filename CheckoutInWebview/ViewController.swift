//
//  ViewController.swift
//  CheckoutInWebview
//
//  Created by Sean O'Hara on 2022-09-06.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    
    var url = URL(string: "https://merchant.platform-qa.breadgateway.com/host")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: url!)
        webView.load(request)
        setupRefreshControl()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.scrollView.bounces = true
        view = webView
    }
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshWebView(sender:)), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
    }

    @objc
    private func refreshWebView(sender: UIRefreshControl) {
        print("refreshing...")
        webView.load(URLRequest(url: url!))
        sender.endRefreshing()
    }

}

