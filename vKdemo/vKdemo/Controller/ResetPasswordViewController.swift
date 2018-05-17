//
//  ResetPasswordViewController.swift
//  vKdemo
//
//  Created by Pisal on 3/13/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTypeAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "registerButton", sender: self)
    }
    

}
