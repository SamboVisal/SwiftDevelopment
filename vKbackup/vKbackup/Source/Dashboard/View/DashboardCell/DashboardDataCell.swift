//
//  DashboardDataCell.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/25/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class DashboardDataCell: UICollectionViewCell{
    
    var dataEachCell: DataSection? {
        didSet{
            if let imageName = dataEachCell?.imageName {
                print(imageName)
                
                imageView.image = UIImage(named: imageName)
                titleContent.text = dataEachCell?.titleImage
                detailContent.text = dataEachCell?.descImage
                
                
            }
        }
    }
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupData()
    }
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("error")
        
    }
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "car")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    let opacityView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 0.19, green: 0.18, blue: 0.18, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let titleContent: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is banner"
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.textColor = UIColor.white
        return label
        
        
    }()
    
    let detailContent: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is banner"
        label.textColor = UIColor.gray
        return label
        
    }()
    
    func setupData(){
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    
}
