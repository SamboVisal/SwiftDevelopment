//
//  DashBoardViewController.swift
//  vKdemo
//
//  Created by Pisal on 3/14/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreData
import UserNotifications
import  FirebaseAuth
import Firebase

class DashBoardViewController: UIViewController {
   // @IBOutlet weak var MenuButton: UIBarButtonItem!
    @IBOutlet weak var alertButton: UIBarButtonItem!
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    @IBOutlet weak var kiriromScope: UIButton!
    
    let notificationButton: UIButton = UIButton(type: UIButtonType.custom)
    let KIRIROMLAT: Double = 11.346541
    let KIRIROMLNG: Double = 104.065818
    let R: Double = 6371
    let locationManager = CLLocationManager()
    var lat: Double = 0
    var long: Double = 0
    var clickMenu  : Bool  = false
    
    @IBOutlet weak var coverView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(true, forKey: "loginBefore")
        notificationTapped()
       //sideMenus()
        
        TimeModCheck = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.isKirirom), userInfo: nil, repeats: true)
        kiriromScope.layer.cornerRadius = 5
        kiriromScope.setTitle("Identifying...", for: .normal)
        coverView.isHidden = true
        coverView.isUserInteractionEnabled = false
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
        
        case 4:
            alterMessage(title: "Coming soon...", msg: "This feature will be available soon!")
            break
        case 5:
            pushView(identifier: "Internalcall")
            break
        case 6:
            pushView(identifier: "Notification")
            break
        default:
            break
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func sideMenus(){
//        if revealViewController() != nil{
//            MenuButton.target = revealViewController()
//            MenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
//            revealViewController().rearViewRevealWidth = 275
//            revealViewController().rightViewRevealWidth = 160
//        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }
//
//    }
    func sideMenus(){
        
        if revealViewController() != nil {
            
            self.revealViewController().revealToggle(animated: true)
            
            if clickMenu {
                coverView.isHidden = true
                coverView.isUserInteractionEnabled = false
                clickMenu = false
            }else{
                coverView.isHidden = false
                coverView.isUserInteractionEnabled = true
                clickMenu = true
            }
            
            revealViewController().rearViewRevealWidth = (view.bounds.width * 80 ) / 100
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    
    @IBAction func MenuClick(_ sender: Any) {
        sideMenus()
    }
    
    
    
    func CheckUserLocation() -> String{
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self as? CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            
            locationManager.startUpdatingLocation()
            
            if (locationManager.location?.coordinate.longitude != nil ){
                let currentLocation_lat = Double((locationManager.location?.coordinate.latitude)!)
                let currentLocation_long = Double((locationManager.location?.coordinate.longitude)!)
                let kiriromscope: Double = Double(distanceCal(lat: currentLocation_lat, long: currentLocation_long))
                if (kiriromscope < 17){
                    lat = currentLocation_lat
                    long = currentLocation_long
                    
                    return IN_KIRIROM
                }else{
                    return OFF_KIRIROM
                }
            }else{
                return UNDEFINE_MODE
            }
        }else{
            return UNDEFINE_LOCATION
        }
    }
    @objc func isKirirom() {
        CHECK_USER_LOCATION = CheckUserLocation()
        switch CHECK_USER_LOCATION {
        case IN_KIRIROM:
            kiriromScope.setTitle("In-Kirirom Mode", for: .normal)
            let mainGreen = UIColor(hexString: "#008040", alpha: 1)
            kiriromScope.setTitleColor(mainGreen, for: .normal)
            break
        case OFF_KIRIROM:
            kiriromScope.setTitle("Off-Kirirom Mode", for: .normal)
            let mainGreen = UIColor(hexString: "#008040", alpha: 1)
            kiriromScope.setTitleColor(mainGreen, for: .normal)
            break
        case UNDEFINE_MODE:
            kiriromScope.setTitle("UNDEFINED MODE", for: .normal)
            kiriromScope.setTitleColor(UIColor.orange, for: .normal)
        default:
            kiriromScope.setTitle("UNDEFINED LOCATION", for: .normal)
            kiriromScope.setTitleColor(UIColor.red, for: .normal)
        }
    }
    
    func distanceCal(lat: Double, long: Double) -> Double{
        let dLat : Double = (KIRIROMLAT-lat)*(Double.pi/180)
        let dLon : Double = (KIRIROMLNG-long)*(Double.pi/180)
        let a : Double = sin(dLat/2) * sin(dLat/2) + cos(lat*(Double.pi/180))*cos(KIRIROMLAT*(Double.pi/180)) * sin(dLon/2) * sin(dLon/2);
        let c :Double = 2 * atan2(sqrt(a), sqrt(1-a));
        let d :Double = R * c; // Distance in km
        return d
    }
    

}
