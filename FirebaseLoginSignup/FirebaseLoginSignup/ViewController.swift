//
//  ViewController.swift
//  FirebaseLoginSignup
//
//  Created by Pisal on 3/13/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil{
            self.loadNewView()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func createAcoount(_ sender: UIButton) {
        if let email = emailText.text, let pass = passText.text{
            Auth.auth().createUser(withEmail: email, password: pass,completion: {
                user,error in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    return
                }
                print("success")
                self.loadNewView()
            })
            
        }
    }
    
    @IBAction func loginPress(_ sender: UIButton) {
         if let email = emailText.text, let pass = passText.text{
            Auth.auth().signIn(withEmail: email, password: pass, completion:{
                (user,error) in
                if let err = error{
                    print(err)
                    return
                }
                print("success")
                self.loadNewView()
            })
        }
    }
    func loadNewView(){
        Screen.goToMain(fromControllerviewController: self, storyBoardId: "LoggedView")
    }
}

