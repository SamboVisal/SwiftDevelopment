//
//  Parsable.swift
//  HomePage
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import Foundation

protocol Parsable {

    associatedtype T
    
    static func generateValue(value: [String: Any] ) -> T?
}
