//
//  AppDelegate.swift
//  urlSession
//
//  Created by Pisal on 5/18/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print(launchOptions?.capacity ?? "")
        
        return true
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
        print("App Will Resign Active")
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        print("App Will Enter Background")
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
        print("App Will Enter Foreground")
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        print("App is being did become active")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        print("App is being terminated")
        
    }


}

