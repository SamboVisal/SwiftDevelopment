//
//  LoginController.swift
//  FirebaseChatApp
//
//  Created by Pisal on 4/1/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {

    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Register", for: .normal)
        button.tintColor = UIColor.white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSpratorView: UIView = {
        let ns = UIView()
        ns.backgroundColor = UIColor(r: 220, g: 200, b: 200)
        ns.translatesAutoresizingMaskIntoConstraints = false
        return ns
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email Address"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSpratorView: UIView = {
        let ns = UIView()
        ns.backgroundColor = UIColor(r: 220, g: 200, b: 200)
        ns.translatesAutoresizingMaskIntoConstraints = false
        return ns
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(r: 61,g: 91,b: 151)
        view.addSubview(inputContainerView)
        view.addSubview(loginRegisterButton)
        
        setupInputViewController()
        setupLoginRegisterButton()
        
    }
    @objc func handleRegister() {
        let user = Auth.auth().currentUser
        if let user = user {
            // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with your backend server,
            // if you have one. Use getTokenWithCompletion:completion: instead.
            let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL
            // ...
        }
    }
    
    func setupInputViewController() {
        
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(nameSpratorView)
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(emailSpratorView)
        inputContainerView.addSubview(passwordTextField)
        //name field
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        //name separator
        nameSpratorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        nameSpratorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSpratorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameSpratorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        //email field
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        emailSpratorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        emailSpratorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSpratorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailSpratorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //password field
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
    }
    
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    

}
extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
