//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Pisal on 3/11/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ballArray = ["ball1","ball2","ball3","ball4","ball5"]
    
    var randomBallNumber: Int = 0
    
    @IBOutlet weak var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBallArray()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buttonPress(_ sender: UIButton) {
        
       updateBallArray()
        
    }
    func updateBallArray(){
        randomBallNumber = Int(arc4random_uniform(5))
        
        ImageView.image = UIImage(named: ballArray[randomBallNumber])
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateBallArray()
    }
    

}

