//
//  DashboardTabController.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/26/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class DashboardTabbarController: UITabBarController{
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        createTabBarController()
        
        
    }
    
    
   
    func createTabBarController(){
        
        let tabCnt = UITabBarController()
        tabCnt.tabBar.backgroundColor = .white
        let dashboardCollectionFlowLayoutInstance = UICollectionViewFlowLayout()
        let dashboardControllerFlowLayoutInit = DashboardViewController(collectionViewLayout: dashboardCollectionFlowLayoutInstance)
        
        let dashboardTabBarController = dashboardControllerFlowLayoutInit
        dashboardTabBarController.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "home-icon") , tag: 0)
        dashboardTabBarController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let dashboradNavigationController = self.setupNavigationController(viewController: dashboardTabBarController)
        
        
        let servicePhoneCollectionFLowLayoutInstance = UICollectionViewFlowLayout()
        let serviceTabbarFlowLayoutInit = ServicePhoneNumberController(collectionViewLayout: servicePhoneCollectionFLowLayoutInstance)
        
        let serviceTabbarController = serviceTabbarFlowLayoutInit
        serviceTabbarController.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "service-icon"), tag: 1)
        serviceTabbarController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let serviceNavigationController = self.setupNavigationController(viewController: serviceTabbarController)
        
        
        
        let sipCallTabBarController = UIViewController()
        sipCallTabBarController.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "sipcall-icon"), tag: 2)
        sipCallTabBarController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let sipCallNavigationController = self.setupNavigationController(viewController: sipCallTabBarController)
        
        
        
        let contactTabBarController = ContactListController()
        contactTabBarController.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "contact-icon"), tag: 3)
        contactTabBarController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let contactNavigationController = self.setupNavigationController(viewController: contactTabBarController)
        
        
        let detailProfileTabBarController = MenuController()
        detailProfileTabBarController.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "detailprofile-icon"), tag: 4)
        
        detailProfileTabBarController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        let detailProfileNavigationController = self.setupNavigationController(viewController: detailProfileTabBarController)
        
        
        let allTabBarViewControllers = [dashboradNavigationController, serviceNavigationController, sipCallNavigationController, contactNavigationController, detailProfileNavigationController]
        viewControllers = allTabBarViewControllers
        
        
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        var tabFrame = self.tabBar.frame
//        tabFrame.size.height = 40
//        tabFrame.origin.y = self.view.frame.size.height - 40
//        self.tabBar.frame = tabFrame
//    }
    
    func setupNavigationController(viewController: UIViewController) -> UINavigationController{
        let navigaitonController = UINavigationController(rootViewController: viewController)
        
        return navigaitonController
    }
    
}
