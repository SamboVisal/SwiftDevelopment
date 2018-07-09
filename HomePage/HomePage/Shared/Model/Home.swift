//
//  Home.swift
//  HomePage
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import Foundation


struct Home {
    
    let pid: String
    let name: String
    let email: String
    let age: Int
}

extension Home: Parsable {
    
    
    private struct Constants {
        
        static let pidKey = "1"
        static let nameKey = "12"
        static let emailKey = "123"
        static let ageKey = "1234"
    
    }
    
    static func generateValue(value: [String: Any]) -> Home?{
        print(value)
        if let pid = value[Constants.pidKey] as? String,
            let name = value[Constants.nameKey] as? String,
            let email = value[Constants.emailKey] as? String,
            let age = value[Constants.ageKey] as? Int {
            
            print(pid)
            
            return Home(pid: pid, name: name, email: email, age: age)
        }
        return nil
        
    }
    
}
