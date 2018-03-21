//
//  SlideBarViewController.swift
//  vKdemo
//
//  Created by Pisal on 3/16/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SlideBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "loginBefore")
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func FBLogout(_ sender: UIButton) {
        print("hiiiiii")
        let manager = FBSDKLoginManager()
        let k = CFPlugInGetTypeID().hashValue
        print(k.distance(to: 1))
        if FBSDKAccessToken.current() != nil {
            UserDefaults.standard.set(false, forKey: "loginBefore")
            manager.logOut()
            UserDefaults.standard.set(false, forKey: "launchBefore")
            let DashController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! ViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = DashController
            
        }else{
            print("No user available")
            let DashController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! ViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = DashController
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
