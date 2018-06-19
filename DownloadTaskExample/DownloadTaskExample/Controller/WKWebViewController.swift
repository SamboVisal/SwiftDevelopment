//
//  WKWebViewController.swift
//  DownloadTaskExample
//
//  Created by Pisal on 5/23/2561 BE.
//  Copyright © 2561 BE Example. All rights reserved.
//

import UIKit
import WebKit

public protocol WebVCDelegate: class {
    func didStartLoading()
    func didFinishLoading(success: Bool)
}

class WKWebViewController: UIViewController, WKUIDelegate {
    
    public weak var delegate: WebVCDelegate?
    var storedStatusColor: UIBarStyle?
    var buttonColor: UIColor? = nil
    var titleColor: UIColor? = nil
    var closing: Bool! = false
    
    lazy var backBarButton: UIBarButtonItem = {
        var BackBarButtonItem = UIBarButtonItem(image: WKWebViewController.bundledImage(named: "SwiftWebVCBack"),
                                                style: UIBarButtonItemStyle.plain,
                                                target: self,
                                                action: #selector(WKWebViewController.goBackTapped(_:)))
        BackBarButtonItem.width = 18.0
        BackBarButtonItem.tintColor = self.buttonColor
        return BackBarButtonItem
    }()
    
    lazy var forwardBarButton: UIBarButtonItem = {
        var ForwardBarButton = UIBarButtonItem(image: WKWebViewController.bundledImage(named: "SwiftWebVCNext"),
                                               style: UIBarButtonItemStyle.plain,
                                               target: self,
                                               action: #selector(WKWebViewController.goForwardTapped(_:)))
        ForwardBarButton.width = 18.0
        ForwardBarButton.tintColor = self.buttonColor
        return ForwardBarButton
    }()
    
    lazy var refreshBarButtonItem: UIBarButtonItem = {
        var tempRefreshBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh,
                                                       target: self,
                                                       action: #selector(WKWebViewController.reloadTapped(_:)))
        tempRefreshBarButtonItem.tintColor = self.buttonColor
        return tempRefreshBarButtonItem
    }()
    
    lazy var stopBarButtonItem: UIBarButtonItem = {
        var tempStopBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.stop,
                                                    target: self,
                                                    action: #selector(WKWebViewController.stopTapped(_:)))
        tempStopBarButtonItem.tintColor = self.buttonColor
        return tempStopBarButtonItem
    }()
    
    lazy var actionBarButtonItem: UIBarButtonItem = {
        var tempActionBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.action,
                                                      target: self,
                                                      action: #selector(WKWebViewController.actionButtonTapped(_:)))
        tempActionBarButtonItem.tintColor = self.buttonColor
        return tempActionBarButtonItem
    }()
    
    lazy var webView: WKWebView = {
        var tempWebView = WKWebView(frame: UIScreen.main.bounds)
        tempWebView.uiDelegate = self
        tempWebView.navigationDelegate = self
        return tempWebView;
    }()
    
    var request: URLRequest!
    
    var navBarTitle: UILabel!
    
    var sharingEnabled = true
    
    deinit {
        webView.stopLoading()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        webView.uiDelegate = nil;
        webView.navigationDelegate = nil;
    }
    
    public convenience init(urlString: String, sharingEnabled: Bool = true) {
        print("Your url string \(urlString)")
        var urlString = urlString
        if !urlString.hasPrefix("https://") && !urlString.hasPrefix("http://") {
            urlString = "https://"+urlString
        }
        self.init(pageURL: URL(string: urlString)!, sharingEnabled: sharingEnabled)
    }
    
    public convenience init(pageURL: URL, sharingEnabled: Bool = true) {
        self.init(aRequest: URLRequest(url: pageURL), sharingEnabled: sharingEnabled)
    }
    
    public convenience init(aRequest: URLRequest, sharingEnabled: Bool = true) {
        self.init()
        self.sharingEnabled = sharingEnabled
        self.request = aRequest
    }
    func loadRequest(_ request: URLRequest){
        webView.load(request)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        view = webView
        loadRequest(request)
    }
    override func viewWillAppear(_ animated: Bool) {
        assert(self.navigationController != nil, "SVWebViewController needs to be contained in a UINavigationController. If you are presenting SVWebViewController modally, use SVModalWebViewController instead.")
        navBarTitle = UILabel()
        navBarTitle.backgroundColor = UIColor.clear
        navBarTitle.textColor = self.titleColor
        navBarTitle.shadowOffset = CGSize(width: 0, height: 1)
        navBarTitle.font = UIFont(name: "HelveticaNeue-Medium", size: 17.0)
        navBarTitle.textAlignment = .center
        navigationItem.titleView = navBarTitle;
        super.viewWillAppear(true)
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) {
            self.navigationController?.setToolbarHidden(false, animated: false)
        }
        else if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
            self.navigationController?.setToolbarHidden(true, animated: true)
        }
        
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) {
            self.navigationController?.setToolbarHidden(true, animated: true)
        }
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    //Toolbar
    func updateToolBarItems(){
        backBarButton.isEnabled = webView.canGoBack
        forwardBarButton.isEnabled = webView.canGoForward
        
        let refreshStopBarButtonItem: UIBarButtonItem = webView.isLoading ? stopBarButtonItem : refreshBarButtonItem
        
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        let flexibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
            
            let toolbarWidth: CGFloat = 250.0
            fixedSpace.width = 35.0
            
            let items: NSArray = sharingEnabled ? [fixedSpace, refreshStopBarButtonItem, fixedSpace, backBarButton, fixedSpace, forwardBarButton, fixedSpace, actionBarButtonItem] : [fixedSpace, refreshStopBarButtonItem, fixedSpace, backBarButton, fixedSpace, forwardBarButton]
            
            let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: toolbarWidth, height: 44.0))
            if !closing {
                toolbar.items = items as? [UIBarButtonItem]
                if presentingViewController == nil {
                    toolbar.barTintColor = navigationController!.navigationBar.barTintColor
                }
                else {
                    toolbar.barStyle = navigationController!.navigationBar.barStyle
                }
                toolbar.tintColor = navigationController!.navigationBar.tintColor
            }
            navigationItem.rightBarButtonItems = items.reverseObjectEnumerator().allObjects as? [UIBarButtonItem]
            
        }
        else {
            let items: NSArray = sharingEnabled ? [fixedSpace, backBarButton, flexibleSpace, forwardBarButton, flexibleSpace, refreshStopBarButtonItem, flexibleSpace, actionBarButtonItem, fixedSpace] : [fixedSpace, backBarButton, flexibleSpace, forwardBarButton, flexibleSpace, refreshStopBarButtonItem, fixedSpace]
            
            if let navigationController = navigationController, !closing {
                if presentingViewController == nil {
                    navigationController.toolbar.barTintColor = navigationController.navigationBar.barTintColor
                }
                else {
                    navigationController.toolbar.barStyle = navigationController.navigationBar.barStyle
                }
                navigationController.toolbar.tintColor = navigationController.navigationBar.tintColor
                toolbarItems = items as? [UIBarButtonItem]
            }
        }
    }
    
    @objc func goBackTapped(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @objc func goForwardTapped(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    @objc func reloadTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @objc func stopTapped(_ sender: UIBarButtonItem) {
        webView.stopLoading()
        updateToolBarItems()
    }
    @objc func actionButtonTapped(_ sender: AnyObject) {
        
//        if let url: URL = ((webView.url != nil) ? webView.url : request.url) {
//            let activities: NSArray = [SwiftWebVCActivitySafari(), SwiftWebVCActivityChrome()]
//
//            if url.absoluteString.hasPrefix("file:///") {
//                let dc: UIDocumentInteractionController = UIDocumentInteractionController(url: url)
//                dc.presentOptionsMenu(from: view.bounds, in: view, animated: true)
//            }
//            else {
//                let activityController: UIActivityViewController = UIActivityViewController(activityItems: [url], applicationActivities: activities as? [UIActivity])
//
//                if floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1 && UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
//                    let ctrl: UIPopoverPresentationController = activityController.popoverPresentationController!
//                    ctrl.sourceView = view
//                    ctrl.barButtonItem = sender as? UIBarButtonItem
//                }
//
//                present(activityController, animated: true, completion: nil)
//            }
//        }
    }
    
    class func bundledImage(named: String) -> UIImage? {
        let image = UIImage(named: named)
        if image == nil {
            return UIImage(named: named, in: Bundle(for: WKWebViewController.classForCoder()), compatibleWith: nil)
        } // Replace MyBasePodClass with yours
        return image
    }
    func changeView(){
        self.performSegue(withIdentifier: "downloadFileSegue", sender: self)
    }

}
extension WKWebViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.delegate?.didStartLoading()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        updateToolBarItems()
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.delegate?.didFinishLoading(success: true)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        webView.evaluateJavaScript("document.title", completionHandler: {(response, error) in
            self.navBarTitle.text = response as! String?
            self.navBarTitle.sizeToFit()
            self.updateToolBarItems()
        })
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.delegate?.didFinishLoading(success: false)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        updateToolBarItems()
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("Your url is \(navigationAction.request.url?.absoluteString ?? "")")
        let urlOnClick = navigationAction.request.url
        //let getFileName = DownloadItems.getFileName(fileName: (urlOnClick?.absoluteString)!)
        if navigationAction.navigationType == .linkActivated {
            
            print("Last path component \(String(describing: urlOnClick?.lastPathComponent))")
            let Filename = urlOnClick?.lastPathComponent
            print("File name is \(String(describing: Filename))")
            let getExt = urlOnClick?.absoluteString.suffix(4)
            
            if ((getExt?.contains(".mp4"))! || (getExt?.contains(".avi"))! || (getExt?.contains(".wmv"))!){
                self.showAction(urlClick: (urlOnClick?.absoluteString)!, fileName: Filename!, imageOrVideo: "video")
            }
            if getExt == ".jpg" || getExt == ".png"{
                self.showAction(urlClick: (urlOnClick?.absoluteString)!, fileName: Filename!, imageOrVideo: "image")
                DownloadItems.downloadImage()
            }
            if (getExt?.contains(".pdf"))!   {
                self.showAction(urlClick: (urlOnClick?.absoluteString)!, fileName: Filename!, imageOrVideo: "filePDF")
            }
            if (getExt?.contains("docx"))! {
                self.showAction(urlClick: (urlOnClick?.absoluteString)!, fileName: Filename!, imageOrVideo: "docFile")
            }else{
                self.showAction(urlClick: (urlOnClick?.absoluteString)!, fileName: Filename!, imageOrVideo: "ppt")
            }
            
        }
        
        decisionHandler(.allow)
    }
    func showAction(urlClick: String, fileName: String,imageOrVideo: String){
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        let saveAction = UIAlertAction(title: "Save to camera roll", style: UIAlertActionStyle.default) { (alert: UIAlertAction) in
            if imageOrVideo == "video"{
                
                DownloadItems.downloadVideo(url: urlClick, fileName: fileName)
            }else if imageOrVideo == "image"{
                
               DownloadItems.downloadImage()
            }else if imageOrVideo == "filePDF"{
                
                DownloadItems.downloadFile(url: URL(string: urlClick)!, filename: fileName)
            }else if imageOrVideo == "docFile" {
                
                DownloadItems.downloadFile(url: URL(string: urlClick)!, filename: fileName)
                
            }else {
                DownloadItems.downloadFile(url: URL(string: urlClick)!, filename: fileName)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alert: UIAlertAction) in
            print("User choose cancel")
        }
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let details = segue.destination as! ViewController
//
//    }
}
