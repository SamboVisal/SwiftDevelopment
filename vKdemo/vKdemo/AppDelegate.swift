//
//  AppDelegate.swift
//  vKdemo
//
//  Created by Pisal on 3/12/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit

import PushKit

var TimeModCheck = Timer()
var IN_KIRIROM: String = "IN_KIRIROM"
var OFF_KIRIROM: String = "OFF_KIRIROM"
var UNDEFINE_MODE: String = "UNDEFINE MODE"
var UNDEFINE_LOCATION: String = "UNDEFINED LOCATION"
var CHECK_USER_LOCATION = ""
let loginBefore = UserDefaults.standard.bool(forKey: "loginBefore")
let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
var linephoneInit = "" {
    didSet{
        
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        //registerForPushNotification()
        // FB init
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
      
        UIApplication.shared.statusBarStyle = .lightContent
        
        if loginBefore  {
            //Init linphone sip
            //MainDashborad
            self.Dashboard()
        }
        // Override point for customization after application launch.
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        
        return handled
    }
//    func registerForPushNotification(){
//        
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
//            print("Permission granted \(granted)")
//            
//            guard granted else {return}
//            self.getNotificationSetting()
//        }
//        
//    }
//    func getNotificationSetting(){
//        
//        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
//            print("Notification settings \(settings)")
//            guard settings.authorizationStatus == .authorized else {return}
//            UIApplication.shared.registerForRemoteNotifications()
//        }
//        
//    }
//    
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        
//        let tokenPart = deviceToken.map {
//            data -> String in
//            return String(format: "%02.2hhx", data)
//        }
//        
//        let token = tokenPart.joined()
//        print("Device token \(token)")
//        
//        
//        
//    }
//    
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//        print("Failed to register \(error)")
//    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func Dashboard(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "MainDashboard") as!  SWRevealViewController
        appDelegate.window?.rootViewController = yourVC
        appDelegate.window?.makeKeyAndVisible()
        
    }
    func LogoutController(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as!  ViewController
        appDelegate.window?.rootViewController = yourVC
        appDelegate.window?.makeKeyAndVisible()
    }

}

