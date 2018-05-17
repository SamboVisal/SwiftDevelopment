//
//  RegisterViewController.swift
//  vKdemo
//
//  Created by Pisal on 3/13/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class RegisterViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password2: UITextField!
    @IBOutlet weak var Password1: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    var testView : UIView = UIView()
    public var activityIndicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        testView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        testView.alpha=0.5
        
        self.hideKeyboardWhenTypeAround()
        
        userName.delegate = self
        Email.delegate = self
        Password1.delegate = self
        Password2.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userName{
            textField.resignFirstResponder()
            Email.becomeFirstResponder()
        }
        else if textField == Email{
            textField.resignFirstResponder()
            Password1.becomeFirstResponder()
        }
        else if textField == Password1{
            textField.resignFirstResponder()
            Password2.becomeFirstResponder()
        }
        else if textField == Password2{
            textField.resignFirstResponder()
            signInBtn.becomeFirstResponder()
        }
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func Signin(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeSague", sender: self)
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        
        let userNameInput = userName.text
        let emailInput = Email.text
        let pass1 = Password1.text
        let confirmPass = Password2.text
        let length_pass = pass1?.count
        
        if (userNameInput?.isEmpty)! || (emailInput?.isEmpty)! || (pass1?.isEmpty)! || (confirmPass?.isEmpty)! {
            alertMessage(title: "Warning", msg: "All fields cannot empty")
        }
        else if length_pass! < 6 {
            alertMessage(title: "Warning", msg: "Password should more than 6 characters")
        }
        else {
            createAccount(emailInput: emailInput!,pass1: pass1!);
        }
    }
    func createAccount(emailInput: String, pass1: String){
        
        Auth.auth().createUser(withEmail: emailInput, password: pass1, completion:{
            (user,error) in
            if error != nil{
                self.alertMessage(title: "Errors", msg: "There are some errors occur")
                print(error ?? "")
                return
            }else{
               
                
                let DashController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainDashboard") as! SWRevealViewController
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = DashController
            }
            
        })
    }
    
    func alertMessage(title: String, msg: String){
        let alter = UIAlertController(title: title,message: msg,preferredStyle: UIAlertControllerStyle.alert);
        alter.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.default,handler:nil))
        self.present(alter,animated:true,completion:nil)
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
