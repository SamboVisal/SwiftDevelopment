//
//  DashboardCell.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/25/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class DashboardCell: UICollectionViewCell {
    
    private let cellId = "dataCell"
    var dashboardViewController: DashboardViewController?
    let dashboradMainCell = DashboardMainCell()
    var sectionCategory : CellCategory? {
        
        didSet{
            if let sectionName = sectionCategory?.sectionName {
                dashboradMainCell.categoryLabel.text = sectionName
                print("Section name is \(sectionName)")
            }else{
                print("Cannot get section name")
            }
        }
        
    }
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupViewCell(){
        backgroundColor = UIColor.clear
        
        addSubview(dashboradMainCell.dataCollectionView)
        //addSubview(dashboradMainCell.divideLineView)
        addSubview(dashboradMainCell.categoryLabel)
        setupDataCollectionViews()
        setupConstraint()
    }
    func setupDataCollectionViews(){
        
        dashboradMainCell.dataCollectionView.showsHorizontalScrollIndicator = false
        dashboradMainCell.dataCollectionView.dataSource = self
        dashboradMainCell.dataCollectionView.delegate = self
        dashboradMainCell.dataCollectionView.register(DashboardDataCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setupConstraint(){
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dashboradMainCell.categoryLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dashboradMainCell.dataCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[categoryLabel(50)][v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dashboradMainCell.dataCollectionView, "categoryLabel": dashboradMainCell.categoryLabel]))
    }
    
    

}
extension DashboardCell :  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = sectionCategory?.data?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DashboardDataCell
        print("index path item ",indexPath.item)
        cell.dataEachCell = sectionCategory?.data![indexPath.item]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 180, height: frame.height - 35)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = sectionCategory?.data![indexPath.item] {
            dashboardViewController?.showDetailEachItem(data: data)
        }
    }
}

