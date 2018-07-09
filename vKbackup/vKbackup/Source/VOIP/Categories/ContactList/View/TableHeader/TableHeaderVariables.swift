//
//  TableHeaderVariables.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/30/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class TableHeaderVariable {
    
    
    lazy var profileImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 20, y: 27, width: 80, height: 50)
        imageView.image = UIImage(named: "car")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    lazy var profileNameLabel: UILabel = {
       
        let nameLabel = UILabel()
        nameLabel.text = "Sambo Visal"
        nameLabel.frame = CGRect(x: profileImageView.frame.maxX + 8, y: 27, width: 300, height: 30)
        nameLabel.font = UIFont.systemFont(ofSize: 25)
        nameLabel.contentMode = .scaleAspectFill
        
        return nameLabel
        
    }()
    
    
    lazy var extNumber: UILabel = {
       
        let extLabel = UILabel()
        extLabel.frame = CGRect(x: profileImageView.frame.maxX + 8, y: profileNameLabel.frame.maxY , width: 300, height: 25)
        extLabel.font = UIFont.systemFont(ofSize: 15)
        extLabel.textColor = UIColor.gray
        extLabel.contentMode = .scaleAspectFill
        extLabel.text = "My Number: 299022"
        
        return extLabel
        
    }()
    
    
    
}
