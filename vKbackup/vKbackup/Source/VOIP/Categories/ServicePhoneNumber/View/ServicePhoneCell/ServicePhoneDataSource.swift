//
//  ServicePhoneDataSource.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/27/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class ServicePhoneDataSource: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    private let dataSource = DataSource()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        self.addSubViews()

        self.setupDataCollectionViews()

        self.setupConstraintDataCollectionViews()
        
    }
    
}


extension ServicePhoneDataSource {

    
    func addSubViews() {
        
        addSubview(dataSource.dataServiceCollectionView)
        
        
    }
    
    func setupDataCollectionViews (){
        
        dataSource.dataServiceCollectionView.isScrollEnabled = false
        dataSource.dataServiceCollectionView.dataSource = self
        dataSource.dataServiceCollectionView.delegate = self
        dataSource.dataServiceCollectionView.register(ServicePhoneDataCell.self, forCellWithReuseIdentifier: "cellid")
    }
    func setupConstraintDataCollectionViews() {
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dataSource.dataServiceCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dataSource.dataServiceCollectionView]))
    }
    
}

//setup collectionview
extension ServicePhoneDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! ServicePhoneDataCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: frame.width, height: 80)
        return size
    }
   
    
}

class ServicePhoneDataCell: UICollectionViewCell {
    
    let dataCell = DataCell()
    private let dataSource = DataSource()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData () {
        backgroundColor = UIColor.clear
        
        addSubviewsStaffDetail()
        
        setupConstraint()
        
    }
    
    
    
}
extension ServicePhoneDataCell {
    
    ///Add all the relevants views of staff
    func addSubviewsStaffDetail() {
        
        
        addSubview(dataCell.imageStaffView)
        addSubview(dataCell.positionStaffLabel)
        addSubview(dataCell.staffNameLabel)
        addSubview(dataCell.callButton)
        
    }
    
    /// Setup constrains for every views have been added
    func setupConstraint() {
        
        constraintStaffImageView()
        constraintPositionStaffLabel()
        constraintStaffNameLable ()
        constraintCallButton()
        
        
    }
    func constraintStaffImageView (){
        dataCell.imageStaffView.translatesAutoresizingMaskIntoConstraints = false
        dataCell.imageStaffView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20.0).isActive = true
        dataCell.imageStaffView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15.0).isActive = true
        dataCell.imageStaffView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        dataCell.imageStaffView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    func constraintPositionStaffLabel () {
        dataCell.positionStaffLabel.topAnchor.constraint(equalTo: dataCell.imageStaffView.topAnchor, constant: 6).isActive = true
        dataCell.positionStaffLabel.leftAnchor.constraint(equalTo: dataCell.imageStaffView.rightAnchor, constant: 8).isActive = true
        dataCell.positionStaffLabel.rightAnchor.constraint(equalTo: dataCell.callButton.leftAnchor, constant: 12.0).isActive = true
        
        dataCell.positionStaffLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
    func constraintStaffNameLable () {
        dataCell.staffNameLabel.topAnchor.constraint(equalTo: dataCell.positionStaffLabel.bottomAnchor, constant: 2).isActive = true
        dataCell.staffNameLabel.leftAnchor.constraint(equalTo: dataCell.positionStaffLabel.leftAnchor, constant: 0).isActive = true
        dataCell.staffNameLabel.rightAnchor.constraint(equalTo: dataCell.positionStaffLabel.rightAnchor, constant: 0).isActive = true
        dataCell.staffNameLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
    
    func constraintCallButton () {
        dataCell.callButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        dataCell.callButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8.0).isActive = true
        dataCell.callButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        dataCell.callButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
}
