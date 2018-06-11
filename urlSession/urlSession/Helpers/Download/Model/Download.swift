//
//  Download.swift
//  urlSession
//
//  Created by Pisal on 5/21/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import Foundation

class Download{
    
    var track: Track
    init(track: Track) {
        self.track = track
    }
    // Download service sets these values:
    var task: URLSessionDownloadTask?
    var isDownloading = false
    var resumeData: Data?
    
    // Download delegate sets this value:
    var progress: Float = 0
    
}
