//
//  ViewController.swift
//  DownloadTaskExample
//
//  Created by Ralf Ebert on 13/02/2017.
//  Copyright © 2017 Example. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController , UIDocumentInteractionControllerDelegate{

    @IBOutlet weak var openButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    var isSendToApplication: Bool = false
    
   
        var documentInteractionController = UIDocumentInteractionController()
    override func viewDidLoad() {
        let _ = DownloadManager.shared.activate()
        documentInteractionController.delegate = self
        authorizedPhoto()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "File Server"
        DownloadManager.shared.onProgress = { (progress) in
            OperationQueue.main.addOperation {
                self.progressView.progress = progress
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DownloadManager.shared.onProgress = nil
    }
    
    func authorizedPhoto(){
        
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch (status){
            case .authorized:
                print("Access granted")
                break
            case .denied:
                print("Access Denied")
                break
            case .notDetermined:
                break
            case .restricted:
                break
            }
        }
    }
    
    
    @IBAction func openDoc(_ sender: Any) {
        
        print("your  url is \(locationDownload)")
        if locationDownload == nil {
            print("cannot open")
            return
        }
        documentInteractionController.url = locationDownload
        
        if !documentInteractionController.presentOpenInMenu(from: openButton.bounds, in: view, animated: true) {
            print("You don't have an app installed that can handle pdf files.")
        }
    }
    
    func documentInteractionControllerWillPresentOpenInMenu(_ controller: UIDocumentInteractionController) {
        if locationDownload == nil {
            print("cannot open ui")
        }
    }
    func documentInteractionController(_ controller: UIDocumentInteractionController, didEndSendingToApplication application: String?) {
        isSendToApplication = true
        print("your url is \(locationDownload)")
        progressView.setProgress(0.0, animated: true)
        removeFile(url: locationDownload)
        
    }
    
    func removeFile(url: URL){
        if FileManager.default.fileExists(atPath: url.path){
            do{
                try FileManager.default.removeItem(at: locationDownload)
                print("file has been removed")
                
            }catch{
                print("error removing file: \(error.localizedDescription)")
            }
        }else{
            print("not file")
        }
    }
    @IBAction func startDownload(_ sender: Any) {
        let url = URL(string: "http://www.tutorialspoint.com/swift/swift_tutorial.pdf")!
        let task = DownloadManager.shared.activate().downloadTask(with: url)
        task.resume()
        
    }
    static func downloadFile(url: URL){
        let task = DownloadManager.shared.activate().downloadTask(with: url)
        task.resume()
    }
   
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    func documentInteractionControllerWillBeginPreview(_ controller: UIDocumentInteractionController) {
        print("Will begin to be previewed")
    }
}

