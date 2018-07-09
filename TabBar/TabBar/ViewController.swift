//
//  ViewController.swift
//  TabBar
//
//  Created by Pisal on 6/29/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customTabbar()
        self.view.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func customTabbar (){

        let homeController = HomeController()
        let homeNavigation = UINavigationController(rootViewController: homeController)
        homeNavigation.tabBarItem.title = "Home"
        
        let favController = FavoriteController()
        let favNavigation = UINavigationController(rootViewController: favController)
        favNavigation.tabBarItem.title = "Favorite"
        
        let servicePhoneCollectionFLowLayoutInstance = UICollectionViewFlowLayout()
        let serviceTabbarFlowLayoutInit = ExploreController(collectionViewLayout: servicePhoneCollectionFLowLayoutInstance)
        
        let exploreController = serviceTabbarFlowLayoutInit
        let exploreNavigation = UINavigationController(rootViewController: exploreController)
        exploreNavigation.tabBarItem.title = "Explore"
        
        viewControllers = [homeNavigation, favNavigation, exploreNavigation]
        
        
    }
    override func tabBar(_ tabBar: UITabBar, didBeginCustomizing items: [UITabBarItem]) {
        print("did begin")
    }
    override func tabBar(_ tabBar: UITabBar, didEndCustomizing items: [UITabBarItem], changed: Bool) {
        print("did end")
    }
   

}

