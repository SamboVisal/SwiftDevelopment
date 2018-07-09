//
//  MenuUIViews.swift
//  vKclub Version 2
//
//  Created by Pisal on 7/6/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class MenuVariables {
    

    lazy var subViewDetailProfile: CardView = {
        
       
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    lazy var contactUsBtn : UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
      
        return button
        
    }()
    
    lazy var contactUsImageView: UIImageView = {
        
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "contact-us")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var contactUsTextView: UILabel = {
       
        let nameLabel = UILabel()
        nameLabel.text = "Contact Us"
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.sizeToFit()
        nameLabel.textColor = .gray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
        
        
    }()
    
    
    lazy var fileShareBtn: UIButton = {
       
        let button = UIButton()
      
        button.translatesAutoresizingMaskIntoConstraints = false
       
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    lazy var fileShareBtnImageView: UIImageView = {
        
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "filesharing")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var fileShareBtnTextView: UILabel = {
        
        let nameLabel = UILabel()
        nameLabel.text = "File Sharing"
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.sizeToFit()
        nameLabel.textColor = .gray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
        
        
    }()
    
    // Explore Btn
    lazy var exploreBtn: UIButton = {
        
        let button = UIButton()
       
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFill
        return button
        
        
    }()
    
    lazy var exploreBtnImageView: UIImageView = {
        
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "explore")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var exploreBtnTextView: UILabel = {
        
        let nameLabel = UILabel()
        nameLabel.text = "Explore"
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.sizeToFit()
        nameLabel.textColor = .gray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
        
        
    }()
    // End of explore btn image and text
    
    // Map Button
    lazy var mapBtn: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFill
        return button
        
        
    }()
    lazy var mapBtnImageView: UIImageView = {
        
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var mapBtnTextView: UILabel = {
        
        let nameLabel = UILabel()
        nameLabel.text = "Map"
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.sizeToFit()
        nameLabel.textColor = .gray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
        
        
    }()
    // End of Map Button
    
    // Settings Button
    lazy var settingBtn: UIButton = {
        
       
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFill
        return button
        
    }()
    lazy var settingBtnImageView: UIImageView = {
        
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "setting")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var settingBtnTextView: UILabel = {
        
        let nameLabel = UILabel()
        nameLabel.text = "Settings"
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.sizeToFit()
        nameLabel.textColor = .gray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
        
        
    }()
    
    
    // End of setting button
    
    // Logout Button
    lazy var logoutBtn: UIButton = {
       
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFill
        return button
        
        
    }()
    
    lazy var logoutBtnImageView: UIImageView = {
        
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logout")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var logoutBtnTextView: UILabel = {
        
        let nameLabel = UILabel()
        nameLabel.text = "Logout"
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.sizeToFit()
        nameLabel.textColor = .gray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
        
        
    }()
    // End of logout Button
    
}


