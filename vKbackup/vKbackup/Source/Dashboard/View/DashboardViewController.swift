//
//  DashboardViewController.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/25/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit



class DashboardViewController: UICollectionViewController {

    
    private let cellSlide = "slideCell"
    private let largeCellId = "largeDataCellId"
    private let headerCellId = "headerCellId"
    var cellCategory: [CellCategory]?
    var dashbordCell: [BannerCellImage]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
        cellCategory = CellCategory.nameSectionCategory()
        dashbordCell = BannerCellImage.getBannerImage()
        if cellCategory != nil || dashbordCell != nil {
            self.collectionView?.reloadData()
        }
        
    
        self.customNavigationBar()
        
        self.registerCellViews()

    }
   
    func customNavigationBar(){
        self.navigationItem.title = IN_KIRIROM
        self.tabBarController?.navigationController?.navigationBar.prefersLargeTitles = false
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor(red:0.00, green:0.50, blue:0.00, alpha:1.0)]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "learnmore-icon"), style: .plain, target: self, action: nil)
        
    }
  
    func showDetailEachItem(data: DataSection){
        
        let deatailAppController = WebviewSectionController()
        navigationController?.pushViewController(deatailAppController, animated: true)
        
    }
    
    
}


//App Cycle
extension DashboardViewController {
    
    func registerCellViews(){

        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(DashboardCell.self, forCellWithReuseIdentifier: cellSlide)
        collectionView?.register(largeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        collectionView?.register(HeaderBanner.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId)
        collectionView?.showsVerticalScrollIndicator = false
        
    }
    
}

extension DashboardViewController : UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! largeCategoryCell
            cell.sectionCategory = cellCategory?[indexPath.item]
            cell.dashboardViewController = self

            return cell
        }

        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! largeCategoryCell
            cell.sectionCategory = cellCategory?[indexPath.item]
            cell.dashboardViewController = self
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! largeCategoryCell
        cell.sectionCategory = cellCategory?[indexPath.item]
        
        cell.dashboardViewController = self
        return cell
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = cellCategory?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            let size = CGSize(width: view.frame.width, height: 200)
            return size
        }
        if indexPath.item == 1 {
            let size = CGSize(width: view.frame.width, height: 200)
            return size
        }
        let size = CGSize(width: view.frame.width, height: 160)
        return size
    }
    
    
    /// banner section
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath) as! HeaderBanner
      
        header.sectionCategory = dashbordCell?[indexPath.item]
        
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: view.frame.width, height: 370)
        return size
    }
    
    
    
    
    
}





