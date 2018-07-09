//
//  DashboardWebView.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/26/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit
import WebKit

class WebviewSectionController: UIViewController{
    
    var webView = WKWebView()
    var navBarTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:"https://www.vkirirom.com/en/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        view = webView
    }
}
extension WebviewSectionController: WKUIDelegate,WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
   
        print("Starting...")
       
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        
        print("Starting success")
        webView.evaluateJavaScript("document.title", completionHandler: {(response, error) in
            self.navBarTitle.text = response as! String?
            self.navBarTitle.sizeToFit()
            
        })
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Starting falied")
        
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
}
