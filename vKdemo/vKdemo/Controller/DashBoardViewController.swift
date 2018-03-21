//
//  DashBoardViewController.swift
//  vKdemo
//
//  Created by Pisal on 3/14/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController {
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    @IBOutlet weak var alertButton: UIBarButtonItem!
    let notificationButton: UIButton = UIButton(type: UIButtonType.custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(true, forKey: "loginBefore")
        notificationTapped()
        sideMenus()
        // Do any additional setup after loading the view.
    }
    private func notificationTapped(){
        notificationButton.tag = 6
        notificationButton.setImage(#imageLiteral(resourceName: "Notification"), for: UIControlState.normal)
        notificationButton.addTarget(self, action: #selector(self.BtnTag), for: .touchUpInside)
        notificationButton.frame = CGRect(x:0, y:0, width: 25, height:25)
        let barButton = UIBarButtonItem(customView: notificationButton)
        let width = barButton.customView?.widthAnchor.constraint(equalToConstant: 25)
        width?.isActive = true
        let height = barButton.customView?.heightAnchor.constraint(equalToConstant: 25)
        height?.isActive = true
        self.navigationItem.rightBarButtonItem = barButton
        
        
    }
    
    @IBAction func BtnTag(_ sender: Any) {
        
        let btntag : Int = (sender as AnyObject).tag
        switch btntag {
        case 1:
            pushView(identifier: "Service")
            break
        case 2:
            pushView(identifier: "Map")
            break
        case 3:
            pushView(identifier: "AboutUs")
            break
        case 5:
            pushView(identifier: "InternalCall")
            break
        case 4:
            alterMessage(title: "Coming soon...", msg: "This feature will be available soon!")
            break
        
        case 6:
            pushView(identifier: "Notification")
            break
        default:
            break
        }
    }
   
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sideMenus(){
        if revealViewController() != nil{
            MenuButton.target = revealViewController()
            MenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
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
