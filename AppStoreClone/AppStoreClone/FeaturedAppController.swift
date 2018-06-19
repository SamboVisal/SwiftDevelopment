//
//  ViewController.swift
//  AppStoreClone
//
//  Created by Pisal on 6/15/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class FeaturedAppController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    private let cellId = "cellId"
    var appCategory: [AppCategory]?
    
    var app: AppCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appCategory = AppCategory.sampleAppCategories()
        setNavigation()
        AppCategory.featuredApp()
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    func setNavigation(){
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.green]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "IN-Kirirom Mode"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more-icon"), style: .plain, target: self, action: #selector(categoryBtn))
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        //type of category each cell
        cell.appCategory = appCategory?[indexPath.item]
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategory?.count {
            return count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: view.frame.width, height: 200)
        return size
    }
    
    @objc func categoryBtn(){
        
    }

}

