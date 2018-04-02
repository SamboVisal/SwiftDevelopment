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
    let customToken = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGFpbXMiOnsicHJlbWl1bUFjY291bnQiOnRydWV9LCJ1aWQiOiJhNlF6dUhWSDdBWDZybEQ0Sk5BRll5YU1zV0IzIiwiaWF0IjoxNTIyMzM4ODg3LCJleHAiOjE1MjIzNDI0ODcsImF1ZCI6Imh0dHBzOi8vaWRlbnRpdHl0b29sa2l0Lmdvb2dsZWFwaXMuY29tL2dvb2dsZS5pZGVudGl0eS5pZGVudGl0eXRvb2xraXQudjEuSWRlbnRpdHlUb29sa2l0IiwiaXNzIjoiZmlyZWJhc2UtYWRtaW5zZGstbHNkZTFAdmthcHAtNmFjMzQuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJmaXJlYmFzZS1hZG1pbnNkay1sc2RlMUB2a2FwcC02YWMzNC5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSJ9.MPGxFB5Wgp40t8Tw1JCFsz-jUZKC-ZozDro0cI5ukEF80WzcbTClQtEA1JoaqES663jH1xUapQirO-eRtvGxIRMPLBVwp3DLVbtQiE0NGgDPkPDUXUFj30clodgxfINvzvVPmxf37g6L-pVfCTcxrtGr3LUrrQ_o2cgOtegT-2zkc8zFR1OjDcY0SzTx5pp6Gsz_5eEtxchQ_zhk5yCiQac-3vOkoDpPtFmbu70f2f_8QkZJTupJP2fo3zBjtv1yEx3YprneGo7Q4BzFo6YVnORVlkf8-5ExOW346hUCPu-rwAKYPxL5NWnog2IePrICaww_PwzeHGoeuS4xJ004bA";
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
            print("user id ", User?.uid)
            print("User email ", User?.email)
            let currentUser = Auth.auth().currentUser
            if currentUser != nil  {
                currentUser?.getIDToken(completion: { (User, err) in
                    print("Token ",User ?? ""," great")
                })
            }
            
            
        }
    }
    func showLogin(user: User?){
        
        var title = "unable to login"
        var message = "please verify token id"
        if let user = user {
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

