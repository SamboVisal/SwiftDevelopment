//
//  Products.swift
//  vKdemo
//
//  Created by Pisal on 3/19/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
class Product{
    var image: UIImage
    var title: String
    var description: String
    
    init(titled: String, description: String, imageName: String   ) {
        self.title = titled
        self.description = description
        if let image = UIImage(named: imageName){
            self.image = image
        }else{
            self.image = UIImage(named: "profile-icon")!
        }
    }
}
