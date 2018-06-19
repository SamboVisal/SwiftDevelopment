//
//  Download.swift
//  DownloadTaskExample
//
//  Created by Pisal on 5/27/2561 BE.
//  Copyright © 2561 BE Example. All rights reserved.
//

import Foundation

class Download{
    
    var fileDownload: fileDownload
    init(fileDownload: fileDownload) {
        self.fileDownload = fileDownload
    }
    
    var task: URLSessionDownloadTask?
    var isDownloading = false
    var resumeData: Data?
    
    // Download delegate sets this value:
    var progress: Float = 0
    
}
