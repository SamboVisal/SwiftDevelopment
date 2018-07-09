//
//  DashboardBanner.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/26/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class HeaderBanner: UICollectionViewCell,  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    
    var cellCategory: [BannerCellImage]?
    var sectionCategory: BannerCellImage?
    private let headerCellId = "headerCellId"
    
    var middle : Int?
    private var usedToChange = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //cellCategory = BannerCellImage.getBannerImage()
        print("first ", cellCategory ?? "no first")
        print("======= ",sectionCategory?.dataBanner?.count ?? "no value")
        setupViewsCell()
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Errpr")
    }
    let dataBannerCollectionView: UICollectionView = {
        
        var scrollInterval: Int = 3
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    
    func setupViewsCell(){
        dataBannerCollectionView.showsHorizontalScrollIndicator = false
    
        
        dataBannerCollectionView.dataSource = self
        dataBannerCollectionView.delegate = self
        
        dataBannerCollectionView.register(HeaderBannerDataCell.self, forCellWithReuseIdentifier: headerCellId)
        
        addSubview(dataBannerCollectionView)
        setupConstraintDataBannerCollectionView()
        
        
        
    }
    func setupConstraintDataBannerCollectionView(){
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dataBannerCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v0]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dataBannerCollectionView]))
    }
    
    
    
    
    
}


extension HeaderBanner {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = sectionCategory?.dataBanner?.count {

            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCellId, for: indexPath) as! HeaderBannerDataCell
        cell.dataBannerCell = sectionCategory?.dataBanner![indexPath.item]
        print("index path data ",indexPath)
        
        if usedToChange {
            
            print("already changed")
        }
        else {
            
            changeSlide()
        }
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       
        
        let size = CGSize(width: frame.width - 100 , height: 350)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Banner selected")
        
    }
    
    func changeSlide() {
        usedToChange = true
        dataBannerCollectionView.scrollToItem(at: IndexPath.init(item: (sectionCategory?.dataBanner?.count)! / 2, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}


class HeaderBannerDataCell: UICollectionViewCell {
    
    var dataBannerCell: DataBanner? {
        
        didSet{
            if let imageName = dataBannerCell?.imageBannerName {
                print("==== ",imageName)
                bannerImageView.image = UIImage(named: imageName)
                titleBanner.text = dataBannerCell?.titleEachBanner
                detailBanner.text = dataBannerCell?.detailEachBanner
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDataBannerCell()
    }
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("error")
        
    }
    let bannerImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var titleBanner: UILabel = {
       
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Oblique", size: 30)
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is banner"
        label.textColor = UIColor.white
        return label
        
    }()
    
    let detailBanner: UILabel = {
       
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.sizeToFit()
        return label
    }()
    
    let opacityView: UIView = {
       
        let view = UIView()
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setupDataBannerCell(){
        
        addSubview(bannerImageView)
        bannerImageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        bannerImageView.layer.borderWidth = 0.5
        bannerImageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        
        opacityView.frame = CGRect(x: 0, y: bannerImageView.frame.maxY / 1.5, width: frame.width, height: frame.height / 2.6)
        titleBanner.frame = CGRect(x: 12, y: 12, width: frame.width, height: 40)
        bannerImageView.addSubview(opacityView)
        
        detailBanner.frame = CGRect(x: 12, y: titleBanner.frame.maxY + 1, width: frame.width, height: 20)
        
        opacityView.addSubview(titleBanner)
        opacityView.addSubview(detailBanner)
    }
}
