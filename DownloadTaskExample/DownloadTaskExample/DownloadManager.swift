// Copyright 2017, Ralf Ebert
// License   https://opensource.org/licenses/MIT
// Source    https://www.ralfebert.de/snippets/ios/urlsession-background-downloads/

import Foundation

class DownloadManager : NSObject, URLSessionDelegate, URLSessionDownloadDelegate {

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
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//        guard let sourceURL = downloadTask.originalRequest?.url else {return}
//        print("source url is: \(sourceURL)")
//        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let destinationURL = documentsPath.appendingPathComponent(documentsPath.lastPathComponent)
//        print("Destination URL: \(destinationURL)")
//        let fileManager = FileManager.default
//        try? fileManager.removeItem(at: destinationURL)
//        do{
//            try fileManager.copyItem(at: location, to: destinationURL)
//        }catch {
//            print("Could not copy file to disk \(error.localizedDescription)")
//        }
//
//        debugPrint("Download finished: \(location)")
//        loca = location
//        debugPrint("download task : \(downloadTask)")
//        ViewController().documentInteraction(location: location)
        
        debugPrint("Download finished: \(location)")
        do {
            let downloadedData = try Data(contentsOf: location)
            print("downloaded data \(downloadedData)")
            DispatchQueue.main.async(execute: {
                print("transfer completion OK!")
                
                let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
                let destinationPath = documentDirectoryPath.appendingPathComponent("swift.pdf")
                
                let pdfFileURL = URL(fileURLWithPath: destinationPath)

                FileManager.default.createFile(atPath: pdfFileURL.path, contents: downloadedData, attributes: nil)
                
                
                print("Your pdfFileURL \(pdfFileURL)")
                
                if FileManager.default.fileExists(atPath: pdfFileURL.path) {
                    print("pdfFileURL present!") // Confirm that the file is here!
                    locationDownload = pdfFileURL.absoluteURL
                    FileQuickLookController().copyFile()
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
    
    
}

