//
//  ViewController.swift
//  vKdemo
//
//  Created by Pisal on 3/12/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class ViewController: UIViewController , FBSDKLoginButtonDelegate{
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var FBButton: UIButton!
    let loginButton: FBSDKButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //view.addSubview(loginButton)
        //loginButton.center = view.center
        
        let loginFB = FBSDKLoginButton()
        view.addSubview(loginFB)
        loginFB.center = view.center
        loginFB.delegate = self
        loginFB.readPermissions = ["email","public_profile"]
        do{
            try Auth.auth().signOut()
        }catch{
            print("Error while signing out!")
        }
        self.hideKeyboardWhenTypeAround()
       
        
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Logged Out")
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error)
        }
        
        showEmail();
    }
    func showEmail(){
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else {
            return
        }
        let credential = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        
        Auth.auth().signIn(with: credential) { (User, Error) in
            if Error != nil{
                print("Error",Error ?? "")
                return
            }
            UIComponentController.presentActivityIndicator(view: self.view, option: true)
            print("Success login ",User ?? "")
        }
        FBSDKGraphRequest(graphPath: "/me",parameters: ["fields":"id,name,email"]).start { (connection, user, error) in
            if error != nil {
                print("failed to start graph ",error ?? "")
            }
            
            print("user graph ",user ?? "")
            
            let DashController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainDashboard") as! SWRevealViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = DashController
        }
        
        
        
    }

    @IBAction func FBSignIn(_ sender: Any) {
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
//        Auth.auth().signIn(withCustomToken: customToken) { (user, err) in
//            if let error = err {
//                print("unable to sign in")
//
//                self.showLogin(user: nil)
//                return
//            }
//            if let user = user {
//                print("user signed in ", user.email)
//                self.showLogin(user: user)
//            }
//        }
        Auth.auth().signIn(withEmail: userNameField.text!, password: passwordField.text!) { (User, err) in
            if err != nil {
            
            }
            
            
            
        }
    }
    func showLogin(user: User?){
        
        var title = "unable to login"
        var message = "please verify token id"
        if user != nil {
            title = "login"
            message = "done bro"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let user = Auth.auth().currentUser
//        user?.getIDTokenForcingRefresh(true, completion: { (customToken, err) in
//
//        })
//
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        self.performSegue(withIdentifier: "registerButton", sender: self)
        
    }
    
    
}

