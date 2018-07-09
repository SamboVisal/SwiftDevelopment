//
//  ServicePhoneNumberController.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/27/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class ServicePhoneNumberController: UICollectionViewController {
    
    private let cellServiceId = "serviceCellId"
    private let cellHeaderId = "headerCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupServiceCollectionViews()
        setupNavigationItem()
        
    }
    
}



extension ServicePhoneNumberController: UICollectionViewDelegateFlowLayout {
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellServiceId, for: indexPath) as! ServicePhoneDataSource
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension ServicePhoneNumberController {
    
    func setupServiceCollectionViews() {
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ServicePhoneDataSource.self, forCellWithReuseIdentifier: cellServiceId)
        collectionView?.showsVerticalScrollIndicator = false
    }
    
    func setupNavigationItem(){
        
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.title = "Services"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

