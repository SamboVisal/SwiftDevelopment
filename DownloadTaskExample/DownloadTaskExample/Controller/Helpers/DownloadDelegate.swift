//
//  DownloadDelegate.swift
//  DownloadTaskExample
//
//  Created by Pisal on 5/27/2561 BE.
//  Copyright © 2561 BE Example. All rights reserved.
//

import Foundation
import UIKit

extension DownloadFileController: URLSessionDownloadDelegate{
    
    
    func activate() -> URLSession {
        let config = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).background")
        
        // Warning: If an URLSession still exists from a previous download, it doesn't create a new URLSession object but returns the existing one with the old delegate object attached!
        return URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
       
        guard let sourceURL = downloadTask.originalRequest?.url else { return }
        let download = downloadService.activeDownloads[sourceURL]
        downloadService.activeDownloads[sourceURL] = nil
        let destinationURL = localFilePath(for: sourceURL)
        
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)
        do{
            try fileManager.copyItem(at: location, to: destinationURL)
            download?.fileDownload.downloaded = true
            download?.fileDownload.locationURL = destinationURL
            //session.finishTasksAndInvalidate()
            
            //file.remove(at: (download?.fileDownload.index)!)
        }catch let error {
            print("Could not copy file \(error.localizedDescription)")
        }
        
        if let index = download?.fileDownload.index {
            DispatchQueue.main.async {
                self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
            }
        }
        
    }
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        print("Invalidate error \(error.debugDescription)")
        
    }
    
    // Updates progress info
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64, totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {
        // 1
        guard let url = downloadTask.originalRequest?.url,
            let download = downloadService.activeDownloads[url]  else { return }
        // 2
        download.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        // 3
        let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite,
                                                  countStyle: .file)
        // 4
        DispatchQueue.main.async {
            if let trackCell = self.tableView.cellForRow(at: IndexPath(row: download.fileDownload.index,
                                                                       section: 0)) as? tableCell {
                trackCell.updateDisplay(progress: download.progress, totalSize: totalSize)
            }
        }
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        debugPrint("Task completed with error: \(task), error: \(String(describing: error))")
        
    
        
        switch task.state {
        case .running:
            print("Your task is running")
            break
        case .canceling:
            print("Your tasking being cancelled")
            break
        case .completed:
            print("Your task is completed")
            //session.finishTasksAndInvalidate()
            break
        default:
            break
            
        }
        
    }
}

