//
//  AppDelegate.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/22/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

let IN_KIRIROM = "In-Kirirom Mode"
let OUT_KIRIROM = "Off-Kirirom Mode"
let UNIDEFINE_MODE = "Undifined Mode"
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = DashboardTabbarController()
        window?.makeKeyAndVisible()
        
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor(red:0.00, green:0.50, blue:0.00, alpha:1.0)
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
       
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }


}



