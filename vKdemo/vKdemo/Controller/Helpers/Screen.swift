//
//  Screen.swift
//  vKdemo
//
//  Created by Pisal on 3/17/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

struct Screen{
    static func goToMain(fromControllerviewController: UIViewController,storyBoardId: String){
        
        let storyboard = UIStoryboard(name: "Main",bundle:nil)
        let mainController = storyboard.instantiateViewController(withIdentifier: storyBoardId)
        UIApplication.shared.keyWindow?.rootViewController = mainController
    }
}
