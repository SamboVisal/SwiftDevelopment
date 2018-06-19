//
//  InputViewController.swift
//  iOSApp
//
//  Created by Pisal on 3/21/18.
//

import UIKit

class InputViewController: UIViewController {
    var Input = ""
    @IBOutlet weak var InputAdd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SubmitIp(_ sender: UIButton) {
        
        Input = InputAdd.text!
        
        performSegue(withIdentifier: "goValue", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let desV = segue.destination as! MainViewController
        desV.hostName = Input
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
