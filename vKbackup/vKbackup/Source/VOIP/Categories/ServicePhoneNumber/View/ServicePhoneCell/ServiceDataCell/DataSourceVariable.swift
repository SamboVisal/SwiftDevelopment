//
//  DataSourceVariable.swift
//  vKclub Version 2
//
//  Created by Pisal on 7/1/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class DataSource {
    
    lazy var dataServiceCollectionView: UICollectionView = {
        
//        var cornerRadius: CGFloat = 0
//        var shadowColor: UIColor = UIColor.black
//        let shadowOffSetWdith: Int = 0
//        let shadowOffSetHeight: Int = 1
//        var shadowOpacity: Float = 0.2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1.0)
       
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    
//        collectionView.layer.cornerRadius = cornerRadius
//        collectionView.layer.shadowColor = shadowColor.cgColor
//        collectionView.layer.shadowOffset = CGSize(width: shadowOffSetWdith, height: shadowOffSetHeight)
//        let shadowPath = UIBezierPath(roundedRect: collectionView.bounds, cornerRadius: cornerRadius)
//        collectionView.layer.shadowPath = shadowPath.cgPath
//        collectionView.layer.shadowOpacity = shadowOpacity
        return collectionView
        
    }()
    
    lazy var cardView: CardView = {
        
       
        let view = CardView()
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 400, height: 100)
        return view
        
        
    }()
    
}
