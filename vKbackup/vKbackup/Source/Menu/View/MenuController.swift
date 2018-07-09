//
//  MenuController.swift
//  vKclub Version 2
//
//  Created by Pisal on 7/4/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    private var menuVariable = MenuVariables()
    
    lazy var imageUser: UIImageView = {
        
       
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "pineresort")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    lazy var profileView: UIView = {
        
       
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    lazy var detailProfileView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        
        view.layer.masksToBounds = true
        return view
        
    }()
    
    
    lazy var userName: UILabel = {
        
       
        let nameLabel = UILabel()
        nameLabel.text = "Sambo Visal"
        nameLabel.font = UIFont.systemFont(ofSize: 40)
        nameLabel.sizeToFit()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    lazy var userCompany: UILabel = {
        
        let nameLabel = UILabel()
        nameLabel.text = "Chain Company"
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.sizeToFit()
        nameLabel.textColor = .gray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
        
        
    }()
    
    
    lazy var userPosition: UILabel = {
       
        let nameLabel = UILabel()
        nameLabel.text = "iOS Developer"
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.sizeToFit()
        nameLabel.textColor = .gray
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
        
        
    }()
    
    lazy var detailProfileBtn: UIButton = {
       
        let callBtn = UIButton()
        callBtn.backgroundColor = UIColor(red:0.00, green:0.50, blue:0.00, alpha:1.0)
        callBtn.translatesAutoresizingMaskIntoConstraints = false
        callBtn.layer.cornerRadius = 8
        callBtn.setTitle("PROFILE", for: .normal)
        
        return callBtn
        
    }()
    lazy var sosBtn: UIButton = {
        
        let callBtn = UIButton()
        
        callBtn.translatesAutoresizingMaskIntoConstraints = false
        callBtn.layer.cornerRadius = 8
        callBtn.setTitle("SOS", for: .normal)
        
        callBtn.backgroundColor = .red
        return callBtn
        
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        view.addSubview(profileView)
        view.addSubview(detailProfileView)
        
        
        
        constraintProfileView()
        profileViewSubview()
        constraintImageUserofProfileView()
        
        
        constraintDetailProfileView()
        detailProfileViewSubviews()
        constraintUsernameofDetailProfileView()
        constraintUserCompanyofDetailProfileView()
        constraintUserPositionofDetailProfileView()
        constraintDetailProfileBtnofDetailProfileView()
        constraintSubviewofDetailProfileView()
        constraintSOSBtnofDetailProfileView()
        

       
        
    }
    
    func constraintProfileView() {
        profileView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        profileView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        profileView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: view.frame.height / 2.5).isActive = true
        profileView.backgroundColor = .gray
        
    }
    func profileViewSubview() {
        profileView.addSubview(imageUser)
    }
    
    
    
    func constraintImageUserofProfileView() {
        imageUser.topAnchor.constraint(equalTo: profileView.topAnchor).isActive = true
        imageUser.leftAnchor.constraint(equalTo: profileView.leftAnchor).isActive = true
        imageUser.rightAnchor.constraint(equalTo: profileView.rightAnchor).isActive = true
        imageUser.heightAnchor.constraint(equalToConstant: view.frame.height / 2.5).isActive = true
    }
    func constraintDetailProfileView(){
        
        detailProfileView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -10).isActive = true
        detailProfileView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        detailProfileView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        detailProfileView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        detailProfileView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        detailProfileView.backgroundColor = .white
        
    }
    func detailProfileViewSubviews() {
        
        detailProfileView.addSubview(userName)
        detailProfileView.addSubview(userCompany)
        detailProfileView.addSubview(userPosition)
        detailProfileView.addSubview(detailProfileBtn)
        detailProfileView.addSubview(menuVariable.subViewDetailProfile)
        detailProfileView.addSubview(sosBtn)
        
        
        // Subviews for various button
        menuVariable.subViewDetailProfile.addSubview(menuVariable.contactUsBtn)
        menuVariable.subViewDetailProfile.addSubview(menuVariable.fileShareBtn)
        menuVariable.subViewDetailProfile.addSubview(menuVariable.exploreBtn)
        menuVariable.subViewDetailProfile.addSubview(menuVariable.mapBtn)
        menuVariable.subViewDetailProfile.addSubview(menuVariable.settingBtn)
        menuVariable.subViewDetailProfile.addSubview(menuVariable.logoutBtn)
        
        // Button for Contact Us constraint
        menuVariable.contactUsBtn.topAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.topAnchor).isActive = true
        menuVariable.contactUsBtn.leftAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.leftAnchor).isActive = true
        menuVariable.contactUsBtn.widthAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.widthAnchor, multiplier: 1/3).isActive = true
        menuVariable.contactUsBtn.heightAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.heightAnchor, multiplier: 1/2).isActive = true
            // Image for for Contact Us Constraint
        menuVariable.contactUsBtn.addSubview(menuVariable.contactUsImageView)
        menuVariable.contactUsBtn.addSubview(menuVariable.contactUsTextView)
        menuVariable.contactUsImageView.topAnchor.constraint(equalTo: menuVariable.contactUsBtn.topAnchor, constant: 20).isActive = true
        menuVariable.contactUsImageView.leftAnchor.constraint(equalTo: menuVariable.contactUsBtn.leftAnchor, constant: 40).isActive = true
        menuVariable.contactUsTextView.topAnchor.constraint(equalTo: menuVariable.contactUsImageView.bottomAnchor, constant: 10).isActive = true
        menuVariable.contactUsTextView.leftAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.leftAnchor, constant: 25).isActive = true
        
        // File sharing button constraint
        menuVariable.fileShareBtn.topAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.topAnchor).isActive = true
        menuVariable.fileShareBtn.leftAnchor.constraint(equalTo: menuVariable.contactUsBtn.rightAnchor).isActive = true
        menuVariable.fileShareBtn.widthAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.widthAnchor, multiplier: 1/3).isActive = true
        menuVariable.fileShareBtn.heightAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.heightAnchor, multiplier: 1/2).isActive = true
            // Add views to file sharing button
        menuVariable.fileShareBtn.addSubview(menuVariable.fileShareBtnImageView)
        menuVariable.fileShareBtn.addSubview(menuVariable.fileShareBtnTextView)
            // Add constraint to Image view of file sharing
        menuVariable.fileShareBtnImageView.topAnchor.constraint(equalTo: menuVariable.fileShareBtn.topAnchor, constant: 20).isActive = true
        menuVariable.fileShareBtnImageView.leftAnchor.constraint(equalTo: menuVariable.fileShareBtn.leftAnchor, constant: 40).isActive = true
        menuVariable.fileShareBtnTextView.topAnchor.constraint(equalTo: menuVariable.fileShareBtnImageView.bottomAnchor, constant: 10).isActive = true
        menuVariable.fileShareBtnTextView.leftAnchor.constraint(equalTo: menuVariable.fileShareBtn.leftAnchor, constant: 25).isActive = true
        
        // Add constraint for explore btn
        menuVariable.exploreBtn.topAnchor.constraint(equalTo: menuVariable.contactUsBtn.bottomAnchor).isActive = true
        menuVariable.exploreBtn.leftAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.leftAnchor).isActive = true
        menuVariable.exploreBtn.widthAnchor.constraint(equalTo: menuVariable.contactUsBtn.widthAnchor).isActive = true
        menuVariable.exploreBtn.heightAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.heightAnchor, multiplier: 1/2).isActive = true
        
            // Add views to explore Button
        menuVariable.exploreBtn.addSubview(menuVariable.exploreBtnImageView)
        menuVariable.exploreBtn.addSubview(menuVariable.exploreBtnTextView)
        
            // Add constraint to Image and Text of explore BTN
        menuVariable.exploreBtnImageView.topAnchor.constraint(equalTo: menuVariable.exploreBtn.topAnchor, constant: 20).isActive = true
        menuVariable.exploreBtnImageView.leftAnchor.constraint(equalTo: menuVariable.exploreBtn.leftAnchor, constant: 40).isActive = true
        menuVariable.exploreBtnTextView.topAnchor.constraint(equalTo: menuVariable.exploreBtnImageView.bottomAnchor, constant: 10).isActive = true
        menuVariable.exploreBtnTextView.leftAnchor.constraint(equalTo: menuVariable.exploreBtn.leftAnchor, constant: 35).isActive = true
        
        
        // Add constraint for map button
        menuVariable.mapBtn.topAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.topAnchor).isActive = true
        menuVariable.mapBtn.leftAnchor.constraint(equalTo: menuVariable.fileShareBtn.rightAnchor).isActive = true
        menuVariable.mapBtn.widthAnchor.constraint(equalTo: menuVariable.fileShareBtn.widthAnchor).isActive = true
        menuVariable.mapBtn.heightAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.heightAnchor, multiplier: 1/2).isActive = true
            // Add Subviews to map button
        menuVariable.mapBtn.addSubview(menuVariable.mapBtnImageView)
        menuVariable.mapBtn.addSubview(menuVariable.mapBtnTextView)
            // Add Constraint for image and text
        menuVariable.mapBtnImageView.topAnchor.constraint(equalTo: menuVariable.mapBtn.topAnchor, constant: 20).isActive = true
        menuVariable.mapBtnImageView.leftAnchor.constraint(equalTo: menuVariable.mapBtn.leftAnchor, constant: 40).isActive = true
        menuVariable.mapBtnTextView.topAnchor.constraint(equalTo: menuVariable.mapBtnImageView.bottomAnchor, constant: 10).isActive = true
        menuVariable.mapBtnTextView.leftAnchor.constraint(equalTo: menuVariable.mapBtn.leftAnchor, constant: 43).isActive = true
        
        
        
        // Add constraint to Setting button
        menuVariable.settingBtn.topAnchor.constraint(equalTo: menuVariable.fileShareBtn.bottomAnchor).isActive = true
        menuVariable.settingBtn.leftAnchor.constraint(equalTo: menuVariable.exploreBtn.rightAnchor).isActive = true
        menuVariable.settingBtn.widthAnchor.constraint(equalTo: menuVariable.exploreBtn.widthAnchor).isActive = true
        menuVariable.settingBtn.heightAnchor.constraint(equalTo: menuVariable.exploreBtn.heightAnchor).isActive = true
            // Add subviews of setting button
        menuVariable.settingBtn.addSubview(menuVariable.settingBtnImageView)
        menuVariable.settingBtn.addSubview(menuVariable.settingBtnTextView)
            // Add constraint subview of setting button
        menuVariable.settingBtnImageView.topAnchor.constraint(equalTo: menuVariable.settingBtn.topAnchor, constant: 20).isActive = true
        menuVariable.settingBtnImageView.leftAnchor.constraint(equalTo: menuVariable.settingBtn.leftAnchor, constant: 40).isActive = true
        menuVariable.settingBtnTextView.topAnchor.constraint(equalTo: menuVariable.settingBtnImageView.bottomAnchor, constant: 10).isActive = true
        menuVariable.settingBtnTextView.leftAnchor.constraint(equalTo: menuVariable.settingBtn.leftAnchor, constant: 35).isActive = true
        
        
        // Add constraint to logout Button
        menuVariable.logoutBtn.topAnchor.constraint(equalTo: menuVariable.mapBtn.bottomAnchor).isActive = true
        menuVariable.logoutBtn.leftAnchor.constraint(equalTo: menuVariable.settingBtn.rightAnchor).isActive = true
        menuVariable.logoutBtn.widthAnchor.constraint(equalTo: menuVariable.settingBtn.widthAnchor).isActive = true
        menuVariable.logoutBtn.heightAnchor.constraint(equalTo: menuVariable.settingBtn.heightAnchor).isActive = true
    
            // Add subviews to logout Button
        menuVariable.logoutBtn.addSubview(menuVariable.logoutBtnImageView)
        menuVariable.logoutBtn.addSubview(menuVariable.logoutBtnTextView)
            // Add constraint to subview of logout button
        menuVariable.logoutBtnImageView.topAnchor.constraint(equalTo: menuVariable.logoutBtn.topAnchor, constant: 20).isActive = true
        menuVariable.logoutBtnImageView.leftAnchor.constraint(equalTo: menuVariable.logoutBtn.leftAnchor, constant: 40).isActive = true
        menuVariable.logoutBtnTextView.topAnchor.constraint(equalTo: menuVariable.logoutBtnImageView.bottomAnchor, constant: 10).isActive = true
        menuVariable.logoutBtnTextView.leftAnchor.constraint(equalTo: menuVariable.logoutBtn.leftAnchor, constant: 35).isActive = true
        
    }
    
    func constraintUsernameofDetailProfileView() {
        userName.topAnchor.constraint(equalTo: detailProfileView.topAnchor, constant: 25).isActive = true
        userName.leftAnchor.constraint(equalTo: detailProfileView.leftAnchor, constant: 25).isActive = true
        
        userName.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    func constraintUserCompanyofDetailProfileView() {
        userCompany.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5).isActive = true
        userCompany.leftAnchor.constraint(equalTo: userName.leftAnchor).isActive = true
        userCompany.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func constraintUserPositionofDetailProfileView() {
        userPosition.topAnchor.constraint(equalTo: userCompany.bottomAnchor, constant: 5).isActive = true
        userPosition.leftAnchor.constraint(equalTo: userName.leftAnchor).isActive = true
        userPosition.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func constraintDetailProfileBtnofDetailProfileView(){
        detailProfileBtn.topAnchor.constraint(equalTo: userName.topAnchor).isActive = true
        detailProfileBtn.leftAnchor.constraint(equalTo: userName.rightAnchor).isActive = true
        detailProfileBtn.rightAnchor.constraint(equalTo: detailProfileView.rightAnchor, constant: -20).isActive = true
        detailProfileBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        detailProfileBtn.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    func constraintSubviewofDetailProfileView(){
        
        menuVariable.subViewDetailProfile.backgroundColor = .white
        menuVariable.subViewDetailProfile.topAnchor.constraint(equalTo: userPosition.bottomAnchor, constant: 10).isActive = true
        menuVariable.subViewDetailProfile.leftAnchor.constraint(equalTo: userPosition.leftAnchor).isActive = true
        menuVariable.subViewDetailProfile.rightAnchor.constraint(equalTo: detailProfileBtn.rightAnchor).isActive = true
        menuVariable.subViewDetailProfile.heightAnchor.constraint(equalToConstant: 200).isActive = true
       
    
    }
    
    func constraintSOSBtnofDetailProfileView() {
        sosBtn.topAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.bottomAnchor, constant: 20).isActive = true
        sosBtn.leftAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.leftAnchor).isActive = true
        sosBtn.rightAnchor.constraint(equalTo: menuVariable.subViewDetailProfile.rightAnchor).isActive = true
        sosBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
       
    }
}

