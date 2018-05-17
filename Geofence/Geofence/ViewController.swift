//
//  ViewController.swift
//  Geofence
//
//  Created by Pisal on 4/15/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var myLocation: UITextView!
    
    var permissionGrante: String?
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view, typically from a nib.
        
        setGeofence()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    func setGeofence(){
        let geofenceRegionCenter = CLLocationCoordinate2DMake(11.346541, 104.065818)
        
        let geofenceRegion = CLCircularRegion(center: geofenceRegionCenter, radius: 50, identifier: "InKirirom")
        geofenceRegion.notifyOnEntry = true
        geofenceRegion.notifyOnExit = true
        mapView.setCenter(geofenceRegionCenter, animated: true)
        locationManager.startMonitoring(for: geofenceRegion)
    }
    
//    func grantLocation() -> String{
//        self.locationManager.requestAlwaysAuthorization()
//        self.locationManager.requestWhenInUseAuthorization()
//
//        if CLLocationManager.locationServicesEnabled(){
//            locationManager.delegate = self as? CLLocationManagerDelegate
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//
//            locationManager.startUpdatingLocation()
//            if(locationManager.location?.coordinate.longitude != nil){
//
//            }else{
//                return UNDEFINE_MODE
//            }
//            print("Permission Granted Successfully======")
//            return PERMISSION_GRANTED
//        }else{
//            return PERMISSION_DENIED
//        }
//    }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exit", region.identifier)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Enter", region.identifier)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        mapView.showsUserLocation = (status == .authorizedAlways)
    }
   

}

