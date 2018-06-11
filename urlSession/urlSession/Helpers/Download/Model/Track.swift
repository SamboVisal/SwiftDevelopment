//
//  File.swift
//  urlSession
//
//  Created by Pisal on 5/21/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import Foundation.NSURL

class Track{

    let name: String
    let index: Int
    let previewURL: URL
    var downloaded = false
    
    init(name: String, previewURL: URL,index: Int) {
        self.name = name
        self.previewURL = previewURL
        self.index = index
    }
    
}
