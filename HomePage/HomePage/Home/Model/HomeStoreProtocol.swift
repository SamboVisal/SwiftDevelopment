//
//  HomeStoreProtocol.swift
//  HomePage
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import Foundation


enum HomeStoreError: Error {
    
    case generic
    case invalidURL
    case invalidResponse
}

protocol HomeStoreProtocol {
    
    func getData(persionId: String,  completion: @escaping ([Home]?, Error?) -> ())
    func showData()
    
}

