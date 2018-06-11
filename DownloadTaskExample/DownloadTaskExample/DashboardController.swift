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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if isWebView == "true" {
            isWebView = ""
            let details = segue.destination as! FileWebViewController
            details.urlTarget = urlTarget
            details.fileName = fileName
        }
        if isWebView == "false"{
            isWebView = ""
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
    
        print("PREVIEW DISMISS")
    }
    func documentInteractionControllerWillPresentOpenInMenu(_ controller: UIDocumentInteractionController) {
        print("Preview present")
    }
    func documentInteractionController(_ controller: UIDocumentInteractionController, didEndSendingToApplication application: String?) {
        print("send to application \(String(describing: application))")
        if FileManager.default.fileExists(atPath: destinationUrl.absoluteString){
            print("file exist")
        }
        do{
            try FileManager.default.removeItem(at: destinationUrl)
            
        }catch {
            print("error remove file \(error.localizedDescription)")
        }
    }
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
}
class FileQuickLookController: UIViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate{
    var loadViews: Bool = false
    var urlTargetLink: URL = URL(string: "some-path")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.downloadFile(url: urlTargetLink)
        print("url target: \(urlTargetLink)")
        if taskComplete {
            copyFile()
        }else{
            print("error download file")
        }
        
    }
    func copyFile(){
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let destinationPath = documentDirectoryPath.appendingPathComponent("file.pdf")
        let destinationUrl = URL(fileURLWithPath: destinationPath)
        do{
            try FileManager.default.copyItem(at: locationDownload, to: destinationUrl)
        }
        catch {
            print("error copying file \(error.localizedDescription)")
        }
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
        try! FileManager.default.removeItem(at: locationDownload)
    }
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        return locationDownload as QLPreviewItem
    }
   
    override func viewWillAppear(_ animated: Bool) {
        
    }
}
