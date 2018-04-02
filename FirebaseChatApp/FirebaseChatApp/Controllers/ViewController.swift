//
//  ViewController.swift
//  FirebaseChatApp
//
//  Created by Pisal on 4/1/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
    }
    
    @objc func handleLogout(){
        
        let loginController = LoginController(nibName: nibName, bundle: nil)
        self.present(loginController, animated: true, completion: nil)
        
    }
    


}

