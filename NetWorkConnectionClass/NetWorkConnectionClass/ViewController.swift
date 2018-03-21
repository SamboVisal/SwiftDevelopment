//
//  ViewController.swift
//  NetWorkConnectionClass
//
//  Created by Pisal on 3/20/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var reachability: Reachability?
    
    
    @IBOutlet weak var LabelTest: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reachability = Reachability.init()
        if((self.reachability!.connection) != .none){
            print("internet available")
            LabelTest.text = "Internet available"
        }
        else{
            print("no internet")
            LabelTest.text = "No internet"

        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

