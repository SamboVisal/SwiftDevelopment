//
//  HomeWorker.swift
//  HomePage
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import Foundation


class HomeWorker {
    
    fileprivate var store: HomeStoreProtocol
    
    init(store: HomeStoreProtocol = HomeAPIStore()) {
        self.store = store
    }
    
    func getData(personId: String,  completion: @escaping ([Home]?, Error?) -> ()) {
        
        store.getData(persionId: personId, completion: completion)
        
        store.showData()
    }
}
