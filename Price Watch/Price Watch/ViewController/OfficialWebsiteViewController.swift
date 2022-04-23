//
//  OfficialWebsiteViewController.swift
//  Price Watch
//
//  Created by Henry Liu on 4/22/22.
//

import UIKit
import WebKit

class OfficialWebsiteViewController: UIViewController, WKUIDelegate {

    // passed-in property:
    var productURL : URL!
    
    // variable for WebKit
    var webView : WKWebView!
    
    // webview loading
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = productURL
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
