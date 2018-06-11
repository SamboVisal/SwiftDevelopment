//
//  ViewController.swift
//  WKWebView
//
//  Created by Pisal on 6/4/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController ,  WKNavigationDelegate, UIDocumentInteractionControllerDelegate{
    var webView: WKWebView!
    var url: URL!
    var dc: UIDocumentInteractionController = UIDocumentInteractionController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(savePdf))
        if let path = Bundle.main.path(forResource: "swift_tutorial", ofType: "pdf") {
            url = URL(fileURLWithPath: path)
            dc.delegate = self
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
        else{
            print("Cannot get path")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func savePdf(){
        dc.url = url
        dc.presentOptionsMenu(from: CGRect.zero, in: self.view, animated: true)
        
    }
    
}

