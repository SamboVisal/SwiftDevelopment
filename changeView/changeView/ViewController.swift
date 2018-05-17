//
//  ViewController.swift
//  changeView
//
//  Created by Pisal on 5/16/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit
import QuickLook

class ViewController: UIViewController {

    var checkUrl: URL = URL(string: "https://www.tutorialpoint.com/swift/swift.pdf")!
    var urlTarget: URL = URL(fileURLWithPath: "some-path")
    var isWebView: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchView(_ sender: Any) {
        //let getExt = checkExt(urlLink: checkUrl)
        if let path = Bundle.main.path(forResource: "swift_tutorial", ofType: "pdf"){
            urlTarget = URL(fileURLWithPath: path)
            isWebView = false
            self.performSegue(withIdentifier: "quickLookSague", sender: self)
            
        }else{
            print("Path not exist")
            isWebView = false
            self.performSegue(withIdentifier: "quickLookSague", sender: self)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if isWebView {
            let details = segue.destination as! pdfWebViewController
            details.urlTarget = urlTarget
    
        }else{
            let details = segue.destination as! pdfQuickLookController
            details.urlTarget = urlTarget
        }
        
        
    }
    func checkExt(urlLink: URL)-> String{
        
        return urlLink.absoluteString
    }
}
class pdfWebViewController: UIViewController, UIWebViewDelegate{
    var urlLink: URL = URL(string: "some-url")!
    var urlTarget: URL = URL(fileURLWithPath: "some-path")
    @IBOutlet weak var pdfWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfWebView.delegate = self
        let request = URLRequest(url: urlTarget)
        pdfWebView.loadRequest(request)
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Failed to load webView: \(error)")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Finished loading webView....")
        self.navigationItem.title = "PdfFile"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(downloadPdf))
    }
    @objc func downloadPdf() {
        
    }
}
class pdfQuickLookController: UIViewController , QLPreviewControllerDataSource, QLPreviewControllerDelegate{
    var loadView: Bool = false
    var urlLink: URL = URL(string: "some-url")!
    var urlTarget: URL = URL(fileURLWithPath: "some-path")
    override func viewDidLoad() {
        super.viewDidLoad()
        let preview = QLPreviewController()
        preview.dataSource = self
        preview.delegate = self
        self.present(preview, animated: true, completion: nil)
        
    }
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, shouldOpen url: URL, for item: QLPreviewItem) -> Bool {
        print("URL OPENING: \(url) and for item: \(item)")
        return true
    }
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        loadView = true
    }
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return urlTarget as QLPreviewItem
    }
    override func viewWillAppear(_ animated: Bool) {
        if loadView{
          //self.performSegue(withIdentifier: "viewControllerSague", sender: self)
           
        }
    }
    
}
