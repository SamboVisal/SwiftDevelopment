//
//  CategoryCell.swift
//  AppStoreClone
//
//  Created by Pisal on 6/15/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    private let cellId = "appCellId"
    
    var appCategory: AppCategory? {
        
        didSet {
            if let name = appCategory?.name {
                nameLabel.text = name
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let appCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Best New App"
        name.font = UIFont.systemFont(ofSize: 13)
        name.numberOfLines = 2
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    let divideLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setupView(){
        backgroundColor = UIColor.clear
        //this will add subview to main view of number items section
        addSubview(appCollectionView)
        addSubview(divideLineView)
        addSubview(nameLabel)
        
        setupAppCollectionView()
        setConstraint()
        
    }
    
    func setupAppCollectionView(){
        
        appCollectionView.dataSource = self
        appCollectionView.delegate = self
        appCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    func setConstraint(){
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": divideLineView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appCollectionView, "v1": divideLineView, "nameLabel": nameLabel]))
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = appCategory?.apps?.count {
            
            print("Count of app \(count)")
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let appCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppCell
        appCell.app = appCategory?.apps?[indexPath.item]
        return appCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 100, height: frame.height - 32)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
class AppCell: UICollectionViewCell {
    
    
    var app: App?{
        
        didSet{
            if let name = app?.Name {
                nameLabel.text = name
            }
            categoryLabel.text = app?.Category
            if let price = app?.Price {
                priceLabel.text = "$\(price)"
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "frozen")
        image.layer.cornerRadius = 17
        image.layer.masksToBounds = true
        return image
    }()
    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Frozen Season I"
        name.font = UIFont.systemFont(ofSize: 13)
        name.numberOfLines = 2
        return name
    }()
    let categoryLabel: UILabel = {
        let price = UILabel()
        price.text = "Entertainment"
        price.font = UIFont.systemFont(ofSize: 10)
        price.numberOfLines = 1
        return price
    }()
    let priceLabel: UILabel = {
        
        let label = UILabel()
        label.text = "$3.50"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.darkGray
        return label
        
    }()
    func setupViews(){
        
        addSubview(nameLabel)
        addSubview(imageView)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 32, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 50, width: frame.width, height: 15)
    }
}


