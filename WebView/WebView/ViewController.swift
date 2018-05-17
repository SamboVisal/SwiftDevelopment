//
//  ViewController.swift
//  WebView
//
//  Created by Pisal on 5/9/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit
import Photos
class ViewController: UIViewController , UIWebViewDelegate, UIDocumentInteractionControllerDelegate{

    var documentController : UIDocumentInteractionController!
    let url = NSURL(string: "https://pbs.twimg.com/profile_images/972434879454613507/LFBBn38A_400x400.jpg")
    let urlPDF = NSURL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf")
    let urlServer = NSURL(string: "http://192.168.96.1/")
    var ext = ""
    var scheme = ""
    @IBOutlet weak var webView: UIWebView!
    //var button: UIBarButtonItem!
    var item1: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorizedNs()
        
//        let btn1 = UIButton(type: .custom)
//        btn1.titleLabel?.text = "download"
//        item1 = UIBarButtonItem(customView: btn1)
//        self.navigationItem.rightBarButtonItem = item1
        navigationItem.rightBarButtonItem?.title = "download"
       
        navigationItem.title = "PDF FILE"
        
        let request = NSURLRequest(url: urlServer! as URL)
        webView.loadRequest(request as URLRequest)
        ext = String(describing: urlPDF?.absoluteString?.suffix(3))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        webView.delegate = self
        documentController?.delegate = self
    }
    func authorizedNs(){
        PHPhotoLibrary.requestAuthorization { (done) in
            switch done{
            case .authorized:
                print("access granted")
            case .denied:
                print("access denied")
            case .notDetermined:
                print("not determine")
            case .restricted:
                print("restricted")
            }
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("FINISH LOADING")
    }
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("FINISHED LOAD===")
        
        print("your ext is ", ext)
        if ext == "jpg" || ext == "JPG" || ext == "png" || ext == "PNG" {
            saveImage()
        }
        if ext.contains("pdf") {
            savePdf()
            documentController? = UIDocumentInteractionController.init(url: urlPDF! as URL)
            
            documentController?.presentPreview(animated: true)
            //documentController.presentOpenInMenu(from: item1, animated: true)
            
            print("Your URL is PDF FILE")
            
            
        }
       
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("Error in load url bitches!!!")
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        scheme = (request.url?.absoluteString)!
        print("It was clicked", scheme)
        ext = String(describing: scheme.suffix(3))
        if ext.contains("mp4"){
            showAction()
        }
        if ext.contains("pdf"){
            savePdf()
        }
        if navigationType == .linkClicked {
            print("You click on link")
        }
        
        return true
    }
    func saveImage(){
        let urlData = NSData(contentsOf: self.url! as URL)
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
        let filePath = "\(documentsPath)/mylove.jpg"
        DispatchQueue.main.async {
            urlData?.write(toFile: filePath, atomically: true)
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: URL(fileURLWithPath: filePath))
            }, completionHandler: { (done, error) in
                if done{
                    print("saved to camera")
                }else{
                    print(error ?? "")
                }
            })
        }
    }
    func saveVideo(){
        
        let urlData = NSData(contentsOf: (URL(string: self.scheme))! )
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filepath = "\(documentPath)/video.mp4"
        DispatchQueue.main.async {
            urlData?.write(toFile: filepath, atomically: true)
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: filepath))
            }, completionHandler: { (status, Error) in
                if status{
                    print("Saved video to camera roll")
                }else{
                    print(Error ?? "")
                }
            })
        }
        
    }
    func savePdf(){
        let fileManager = FileManager.default
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = "\(paths)/mylove.pdf"
        let pdfDoc = NSData(contentsOf: URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf")!)
        fileManager.createFile(atPath: filePath as String, contents: pdfDoc as Data?, attributes: nil)
        
        
    }
    
    func documentInteractionController(_ controller: UIDocumentInteractionController, willBeginSendingToApplication application: String?) {
        print("will begin")
    }
    
    func documentInteractionController(_ controller: UIDocumentInteractionController, didEndSendingToApplication application: String?) {
        print("did end")
    }
    
    func showAction(){
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        let saveAction = UIAlertAction(title: "Save to camera roll", style: UIAlertActionStyle.default) { (alert: UIAlertAction) in
            self.saveVideo()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alert: UIAlertAction) in
            print("User choose cancel")
        }
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }

}
extension UIViewController{
    
    
    
    
}

