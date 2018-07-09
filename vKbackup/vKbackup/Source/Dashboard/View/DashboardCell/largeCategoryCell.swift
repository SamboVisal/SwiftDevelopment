//
//  largeCategoryCell.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/30/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class largeCategoryCell: DashboardCell {
    
    private let largeDataCellId = "largeDataCellId"
    override func setupViewCell(){
        super.setupViewCell()
        self.dashboradMainCell.dataCollectionView.register(LargeDataCell.self, forCellWithReuseIdentifier: "largeDataCellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeDataCellId, for: indexPath) as! DashboardDataCell
        cell.dataEachCell = sectionCategory?.data![indexPath.item]
        print("Index path ", indexPath.item)
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("Data cell size", frame.height - 52)
        let size = CGSize(width: 148, height: frame.height - 52)
        return size
    }
    private class LargeDataCell: DashboardDataCell {
        override func setupData() {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(imageView)
            addSubview(opacityView)
            addSubview(titleContent)
            addSubview(detailContent)
            
            
            imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
            print(imageView.frame.width)
            print(imageView.frame.height)
            
            opacityView.frame = CGRect(x: 0, y: imageView.frame.maxY / 1.5, width: frame.width, height: imageView.frame.height / 2.6)
            
            titleContent.frame = CGRect(x: 12, y: 12, width: frame.width, height: 15)
            detailContent.frame = CGRect(x: 12, y: titleContent.frame.maxY + 1, width: frame.width, height: 10)
            
            
            imageView.addSubview(opacityView)
            opacityView.addSubview(detailContent)
            opacityView.addSubview(titleContent)
        }
    }
}
