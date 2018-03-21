//
//  Screen.swift
//  FirebaseLoginSignup
//
//  Created by Pisal on 3/13/18.
//  Copyright © 2018 Pisal. All rights reserved.
//
import UIKit
struct Screen{
    static func goToMain(fromControllerviewController: UIViewController,storyBoardId: String){
        
        let storyboard = UIStoryboard(name: "Main",bundle:nil)
        let mainController = storyboard.instantiateViewController(withIdentifier: storyBoardId)
        UIApplication.shared.keyWindow?.rootViewController = mainController
    }
}
