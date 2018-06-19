

import Foundation
import UIKit
import QuickLook
class DownloadManager : NSObject, URLSessionDelegate, URLSessionDownloadDelegate ,QLPreviewControllerDelegate,QLPreviewControllerDataSource{

    static var shared = DownloadManager()
  
    
    typealias ProgressHandler = (Float) -> ()
    var loca: URL!

    var onProgress : ProgressHandler? {
        didSet {
            if onProgress != nil {
                let _ = activate()
            }
        }
    }

    override private init() {
        super.init()
    }

    func activate() -> URLSession {
        let config = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).background")

        // Warning: If an URLSession still exists from a previous download, it doesn't create a new URLSession object but returns the existing one with the old delegate object attached!
        return URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
    }

    private func calculateProgress(session : URLSession, completionHandler : @escaping (Float) -> ()) {
        session.getTasksWithCompletionHandler { (tasks, uploads, downloads) in
            let progress = downloads.map({ (task) -> Float in
                if task.countOfBytesExpectedToReceive > 0 {
                    return Float(task.countOfBytesReceived) / Float(task.countOfBytesExpectedToReceive)
                } else {
                    return 0.0
                }
            })
            completionHandler(progress.reduce(0.0, +))
        }
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {

        if totalBytesExpectedToWrite > 0 {
            if let onProgress = onProgress {
                calculateProgress(session: session, completionHandler: onProgress)
            }
            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            debugPrint("Progress \(downloadTask) \(progress)")
        }
        print("Total bytes written: \(totalBytesWritten)")
        
        print("Total bytes Expected to write \(totalBytesExpectedToWrite)")
        
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        debugPrint("Download finished: \(location)")
        do {
            let downloadedData = try Data(contentsOf: location)
            print("downloaded data \(downloadedData)")
            DispatchQueue.main.async(execute: {
                print("transfer completion OK!")
                
                let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
                
                let destinationPath = documentDirectoryPath.appendingPathComponent(DOWNLOADFILENAME)
                
                let pdfFileURL = URL(fileURLWithPath: destinationPath)

                FileManager.default.createFile(atPath: pdfFileURL.path, contents: downloadedData, attributes: nil)
                
                
                print("Your pdfFileURL \(pdfFileURL)")
                print("Your destination path URL \(destinationPath)")
                //print("Your last path component \(destinationPath.lastPathComponent)")
                
                if FileManager.default.fileExists(atPath: pdfFileURL.path) {
                    print("pdfFileURL present!") // Confirm that the file is here!
                    locationDownload = pdfFileURL.absoluteURL
                    taskComplete = true

                    let preview = QLPreviewController()
                    preview.dataSource = self
                    preview.delegate = self
                    UIApplication.topViewController()?.navigationController?.present(preview, animated: true, completion: {
                        print("Opened QLPREVIEW")
//                        do {
//                            try FileManager.default.removeItem(atPath: destinationPath)
//                            print("Removed file from temp is successfully")
//                        }catch let error {
//                            print("Error in removing file from temp \(error.localizedDescription)")
//                        }
                        
                        print("Your destination path is \(destinationPath)")
                    })
                  
                    //FileManager.default.removeItem(atPath: pdfFileURL.path)
                }
            })
        } catch {
            print(error.localizedDescription)
        }
        
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        debugPrint("Task completed with error: \(task), error: \(String(describing: error))")
        debugPrint("error \(error.debugDescription)")
        taskComplete = false
        
    }
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, shouldOpen url: URL, for item: QLPreviewItem) -> Bool {
        print("URL OPENING: \(url) and for item: \(item)")
        return true
    }
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        do {
           try FileManager.default.removeItem(at: locationDownload)
            print("The file has been removed====")
        }catch let error {
            print("Cannot remove file \(error.localizedDescription)")
        }
        
        
        
    }
    func previewControllerDidDismiss(_ controller: QLPreviewController) {
        
        //dashboard()
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        print("Location downloaded \(locationDownload)")
        return locationDownload as QLPreviewItem
    }
    func dashboard(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "MainDashboard") as!  DashboardController
        appDelegate.window?.rootViewController = yourVC
        appDelegate.window?.makeKeyAndVisible()
    }
    
    
    
}

