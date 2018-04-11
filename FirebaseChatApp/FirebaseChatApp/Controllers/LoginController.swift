//
//  LoginController.swift
//  FirebaseChatApp
//
//  Created by Pisal on 4/1/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

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
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
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
    
    let imageView: UIImageView  = {
        let im = UIImageView()
        im.image = UIImage(named: "messenger")
        im.translatesAutoresizingMaskIntoConstraints = false
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    let loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.white
        sc.selectedSegmentIndex = 1
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return sc
    }()
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint!
    var nameTextFieldHeightAnchor: NSLayoutConstraint!
    var emailTextFieldHeightAnchor: NSLayoutConstraint!
    var passwordTextFieldHeightAnchor: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(r: 61,g: 91,b: 151)
        view.addSubview(inputContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(imageView)
        view.addSubview(loginRegisterSegmentedControl)
        
        setupInputViewController()
        setupLoginRegisterButton()
        setupImage()
        setupLoginRegisterSegment()
        
    }
    @objc func handleLoginRegister(){
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        }else{
            handleRegister()
        }
    }
    
    @objc func handleLoginRegisterChange(){
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)

        loginRegisterButton.setTitle(title, for: .normal)
        
        // change height of inputContainerView
        inputsContainerViewHeightAnchor.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        //change height of name textfield
        nameTextFieldHeightAnchor.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextFieldHeightAnchor.isActive = true
        
        // change height email
        
        emailTextFieldHeightAnchor.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextFieldHeightAnchor.isActive = true
        
        //change password height
        passwordTextFieldHeightAnchor.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextFieldHeightAnchor.isActive = true
        
        
    }
    func handleLogin(){
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print(error)
            }
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    func handleRegister() {
    
        guard let email = emailTextField.text, let password = passwordTextField.text,let name = nameTextField.text else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (user, Error) in
            
            if Error != nil {
                print(Error ?? "")
                return
            }
            guard let uid = user?.uid else {
                return
            }
            
            ref = Database.database().reference(fromURL: "https://messageappios-6ac68.firebaseio.com/")
            let refChild = ref.child("users").child(uid)
            let values = ["email": email, "name": name]
            refChild.updateChildValues(values, withCompletionBlock: { (error, ref) in
                
                if error != nil {
                    print(error ?? "")
                    return
                }
                self.dismiss(animated: true, completion: nil)
                print("successfully")
                
                
            })
            
        }
        
        
    }
    func setupLoginRegisterSegment(){
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: -12).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    
    func setupInputViewController() {
        
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputsContainerViewHeightAnchor.isActive = true
        
        
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(nameSpratorView)
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(emailSpratorView)
        inputContainerView.addSubview(passwordTextField)
        
        //name field
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor.isActive = true
        
        //name separator
        nameSpratorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        nameSpratorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSpratorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameSpratorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        //email field
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
        emailTextFieldHeightAnchor.isActive = true
        
        
        emailSpratorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        emailSpratorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSpratorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailSpratorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //password field
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor.isActive = true
        
    }
    
    
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    func setupImage() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -12).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
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
