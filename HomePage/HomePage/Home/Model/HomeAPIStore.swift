//
//  HomeAPIStore.swift
//  HomePage
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import Foundation




final class HomeAPIStore: HomeStoreProtocol {
    func showData() {
        print("Data being showed")
    }
    
    
    
    
    func getData(persionId: String, completion: @escaping ([Home]?, Error?) -> ()) {
        
        var home : [Home]?
        let error : Error?
        let tests : [String : Any] = [
            "1" : "hello",
            "12" : "WORLD",
            "123" : "byebye",
            "1234" : "world"
        ]
        
        let test = [tests]
        
       
            
            if persionId == "visal" {
                home = test.flatMap({ t  -> Home? in
                    print(t)
                    return Home.generateValue(value: t)
                    
                })
                
                
            }else{
                error = HomeStoreError.invalidResponse
                
            }
            //completion(home, error)
        
    }
    
}
