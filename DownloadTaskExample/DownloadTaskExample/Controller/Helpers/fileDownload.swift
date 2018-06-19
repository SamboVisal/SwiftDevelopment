//
//  fileDownload.swift
//  DownloadTaskExample
//
//  Created by Pisal on 5/27/2561 BE.
//  Copyright © 2561 BE Example. All rights reserved.
//

import Foundation

class fileDownload{
    
    let name: String
    let previewURL: URL
    let index: Int
    var downloaded = false
    var locationURL: URL
    init(name: String, previewURL: URL, index: Int, locationURL: URL) {
        self.name = name
        self.previewURL = previewURL
        self.index = index
        self.locationURL = locationURL
    }
    
}
