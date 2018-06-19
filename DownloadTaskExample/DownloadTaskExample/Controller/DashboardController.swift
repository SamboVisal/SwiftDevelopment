//
//  DashboardController.swift
//  DownloadTaskExample
//
//  Created by Pisal on 5/12/2561 BE.
//  Copyright © 2561 BE Example. All rights reserved.
//

import UIKit
import QuickLook

class DashboardController: UIViewController {
    
    var checkUrl: URL = URL(string: "https://www.tutorialpoint.com/swift/swift.pdf")!
    var urlTarget: URL = URL(fileURLWithPath: "some-path")
    var urlTargetLink: URL = URL(string: "some-url")!
    var isWebView: String = ""
    var fileName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func WkWebView(_ sender: Any) {
        
        let webVC = WKWebViewController(urlString: "http://192.168.96.1/index.html#httpshare_guest")
        webVC.delegate = self
        self.navigationController?.pushViewController(webVC, animated: true)
        
    }
    
    @IBAction func fileOpen(_ sender: Any) {
        
        if let path = Bundle.main.path(forResource: "swifts_tutorial", ofType: "pdf"){
            urlTarget = URL(fileURLWithPath: path)
            fileName = "swift_tutorial.pdf"
            isWebView = "true"
            self.performSegue(withIdentifier: "webViewSague", sender: self)
            
        }else{
            print("Quicklook is getting started")
            urlTargetLink = URL(string: "http://www.tutorialspoint.com/swift/swift_tutorial.pdf")!
            isWebView = "false"
            self.performSegue(withIdentifier: "quickLookSague", sender: self)
        }
        
    }
   
    @IBAction func downloadFile(_ sender: Any) {
        
        self.prepareDownload()
        
   //     self.performSegue(withIdentifier: "downloadTableSegue", sender: self)
        
    }
    
    @IBAction func downloadSecond(_ sender: Any) {
        self.downloadSecond()
    }
    func downloadSecond(){
        
        let url = URL(string: "http://www.tutorialspoint.com/swift/swift_tutorial.pdf")
        let fileName = "swiftsss.pdf"
        let urlLocation = URL(string: "htt")
        let _: URL! = nil
        let index = 1
        file.append(fileDownload(name: fileName, previewURL: url!, index: index, locationURL: urlLocation!))
        
        
    }
    func prepareDownload(){
        
        let url = URL(string: "http://www.tutorialspoint.com/swift/swift_tutorial.pdf")
        let fileName = "swift.pdf"
        let urlLocation = URL(string: "htt")
        let _: URL! = nil
        let index = 0
        file.append(fileDownload(name: fileName, previewURL: url!, index: index, locationURL: urlLocation!))
        print(file)
       
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if isWebView == "true" {
            isWebView = ""
            let details = segue.destination as! FileWebViewController
            details.urlTarget = urlTarget
            details.fileName = fileName
        }
        if isWebView == "false"{
            HelperClass.PresentActivityIndicator(view: self.view, option: true)
            isWebView = ""
            isDownloadQuicklook = true
            let details = segue.destination as! FileQuickLookController
            details.urlTargetLink = urlTargetLink
        }
        
        
        
    }

    

}

class FileWebViewController: UIViewController, UIWebViewDelegate, UIDocumentInteractionControllerDelegate{
    
    @IBOutlet weak var fileWebView: UIWebView!
    var documentInteractionController = UIDocumentInteractionController()
    var urlTarget: URL = URL(fileURLWithPath: "some-path")
    var destinationUrl: URL = URL(fileURLWithPath: "some-path")
    var fileName: String!
    var isSentToApplication: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        documentInteractionController.delegate = self
        fileWebView.delegate = self
        let request = URLRequest(url: urlTarget)
        fileWebView.loadRequest(request)

    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Failed to load webView: \(error)")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("Finished loading webView....")
        self.navigationItem.title = "Pdf File"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(downloadPdf))
    }
    @objc func downloadPdf() {
        
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let destinationPath = documentDirectoryPath.appendingPathComponent(fileName)
        destinationUrl = URL(fileURLWithPath: destinationPath)
        print("DESTINATION PATH \(destinationUrl)")
        print("URL TARGET \(urlTarget)")
        
        do{
            try FileManager.default.copyItem(at: urlTarget, to: destinationUrl)
        }
        catch {

            print("error: \(error.localizedDescription)")
        }
        
        documentInteractionController.url = destinationUrl
        documentInteractionController.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
        
        
    }
    func documentInteractionControllerDidDismissOpenInMenu(_ controller: UIDocumentInteractionController) {
        if isSentToApplication{
            self.removeFile()
        }
        print("PREVIEW DISMISS")
    }
    func documentInteractionControllerWillPresentOpenInMenu(_ controller: UIDocumentInteractionController) {
        print("Preview present")
        
    }
    func documentInteractionController(_ controller: UIDocumentInteractionController, willBeginSendingToApplication application: String?) {
        
    }
    func documentInteractionController(_ controller: UIDocumentInteractionController, didEndSendingToApplication application: String?) {
        isSentToApplication = true
        self.removeFile()
    }
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    func removeFile(){
        
       
        if FileManager.default.fileExists(atPath: destinationUrl.absoluteString){
            print("file exist")
        }
        do{
            try FileManager.default.removeItem(at: destinationUrl)
            
        }catch {
            print("error remove file \(error.localizedDescription)")
        }
    }
    
}
class FileQuickLookController: UIViewController{
    
    var loadViews: Bool = false
    var urlTargetLink: URL = URL(string: "some-path")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("url target: \(urlTargetLink)")
        if taskComplete {
            
        }else{
            
            ViewController.downloadFile(url: urlTargetLink)
            HelperClass.PresentActivityIndicator(view: self.view, option: false)

        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
}
extension DashboardController: WebVCDelegate {
    
    func didStartLoading() {
        print("Started loading.")
    }
    
    func didFinishLoading(success: Bool) {
        print("Finished loading. Success: \(success).")
    }
    
}

