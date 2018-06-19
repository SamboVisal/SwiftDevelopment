//
//  DownloadImageVide.swift
//  DownloadTaskExample
//
//  Created by Pisal on 5/23/2561 BE.
//  Copyright © 2561 BE Example. All rights reserved.
//

import Foundation.NSURL
import Photos
import UIKit

class DownloadItems{
    
    static func downloadImage(){
        print("Image being downloaded")
        
    }
    static func downloadVideo(url: String, fileName: String){
        
        let urlData = NSData(contentsOf: (URL(string: url))! )
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filepath = "\(documentPath)/\(fileName)"
        print("Your video file path \(filepath)")
        DispatchQueue.main.async {
            urlData?.write(toFile: filepath, atomically: true)
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: filepath))
            }, completionHandler: { (status, Error) in
                if status{
                    print("Saved video to camera roll")
                    try! FileManager.default.removeItem(atPath: filepath)
                    print("File has been removed from the file path")
                }else{
                    print(Error ?? "")
                }
            })
        }
    }
    
    static func downloadFile(url: URL, filename: String){
        DOWNLOADFILENAME = filename
        Task = DownloadManager.shared.activate().downloadTask(with: url)
        Task.resume()
    }
    static func getFileName(fileName: String)-> String{
        let filename = fileName.components(separatedBy: "/").last
        return filename!
    }
    
}
