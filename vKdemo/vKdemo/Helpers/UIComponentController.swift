//
//  UIComponentController.swift
//  vKdemo
//
//  Created by Pisal on 3/17/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func alterMessage(title: String,msg: String){
        let alter = UIAlertController(title: title,message: msg,preferredStyle: UIAlertControllerStyle.alert);
        alter.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.default,handler:nil))
        self.present(alter,animated:true,completion:nil)
    }
    func pushView(identifier: String){
        let storyboard = UIStoryboard(name: "Main",bundle:nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    } 
}
