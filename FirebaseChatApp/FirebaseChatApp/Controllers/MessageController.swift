//
//  ViewController.swift
//  FirebaseChatApp
//
//  Created by Pisal on 4/1/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MessageController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        let image = UIImage(named: "Message")
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        
        checkIfUserLoggedIn()
        
    }
    func checkIfUserLoggedIn(){
        if Auth.auth().currentUser?.uid == nil {
            performSelector(inBackground: #selector(handleLogout), with: nil)
        }else{
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                print(snapshot)
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    self.navigationItem.title = dictionary["name"] as? String
                }
            })
        }
        
    }
    @objc func handleNewMessage (){
        let NewMessageControllers = NewMessageController()
        let navController = UINavigationController(rootViewController: NewMessageControllers)
        self.present(navController, animated: true, completion: nil)
        
    }
    @objc func handleLogout(){
        
        do {
            try Auth.auth().signOut()
        }catch let logError {
            print(logError)
        }
        
        let loginController = LoginController(nibName: nibName, bundle: nil)
        self.present(loginController, animated: true, completion: nil)
        
    }
    


}

