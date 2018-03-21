//
//  LoggedViewController.swift
//  FirebaseLoginSignup
//
//  Created by Pisal on 3/13/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoggedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logoutTapped(_ sender: Any) {
        do{
          try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
            
        }catch {
            print("there an error")
        }
        self.homePage()
    }
    func homePage(){
        
        Screen.goToMain(fromControllerviewController: self, storyBoardId: "Home")
        
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
