//
//  DashboardCellVariable.swift
//  vKclub Version 2
//
//  Created by Pisal on 7/1/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class DashboardMainCell {
    
    lazy var dataCollectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    
    lazy var divideLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.2
        return view
    }()
    lazy var categoryLabel: UILabel = {
        
        let categoryLabel = UILabel()
        categoryLabel.font = UIFont.systemFont(ofSize: 21)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        return categoryLabel
        
    }()
    
    
}
