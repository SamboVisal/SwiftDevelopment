//
//  DataCell.swift
//  vKclub Version 2
//
//  Created by Pisal on 7/1/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class DataCell {
    
    lazy var imageStaffView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "car")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
        
    }()
    
    lazy var positionStaffLabel: UILabel = {
        let staffLabel = UILabel()
        staffLabel.text = "Pine View Resort Kirirom"
        staffLabel.translatesAutoresizingMaskIntoConstraints = false
        staffLabel.textColor = .black
        staffLabel.sizeToFit()
        return staffLabel
    }()
    
    lazy var staffNameLabel: UILabel = {
        
        let staffLabel = UILabel()
        staffLabel.text = "Mr. Khem Productivity"
        staffLabel.textColor = .gray
        staffLabel.translatesAutoresizingMaskIntoConstraints = false
        staffLabel.font = UIFont.systemFont(ofSize: 12)
        staffLabel.sizeToFit()
        return staffLabel
        
    }()
    
    
    
    lazy var callButton: UIButton = {
        
        
        let callBtn = UIButton()
        callBtn.backgroundColor = UIColor(red:0.00, green:0.50, blue:0.00, alpha:1.0)
        callBtn.translatesAutoresizingMaskIntoConstraints = false
        callBtn.layer.cornerRadius = 8
        callBtn.setTitle("CALL", for: .normal)
        
        return callBtn
        
    }()
    
    
}
