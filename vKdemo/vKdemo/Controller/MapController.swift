//
//  MapController.swift
//  vKdemo
//
//  Created by Pisal on 3/18/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class kiriromLocation: NSObject {
    let title: String
    let location: CLLocationCoordinate2D
    let dec: String
    
    let zoom: Float
    
    init(title: String, location: CLLocationCoordinate2D, dec: String, zoom: Float) {
        self.title = title
        self.location = location
        self.dec = dec
        self.zoom = zoom
    }
}

class MapController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    var mapView: GMSMapView?
    var locationManager = CLLocationManager()
    
    var currentDestination: kiriromLocation?
    
    let markerLocation = [
        
        kiriromLocation(title: "Kirirom Institute of Technology ", location: CLLocationCoordinate2DMake(11.3152, 104.0676), dec: "The first boarding school in Cambodia, Specialized in software engineering and offers internship while studying", zoom: 14),
        
        kiriromLocation(title: "Activity Center", location: CLLocationCoordinate2DMake(11.3165,104.0648),dec: "Information regarding various types of fun activities to refresh your mind. Open 8:00am - 5pm", zoom: 14),
        
        kiriromLocation(title: "Pine View Kitchen", location: CLLocationCoordinate2DMake(11.3167,104.0653),dec: "An open space restaurant where you can enjoy modern Khmer cuisine", zoom: 14)
    
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Map"
        Map()
        // Do any additional setup after loading the view.
    }
    func Map(){
        GMSServices.provideAPIKey("AIzaSyBVFrX7a0kJREvfaK0b0g4DDOZA0nUN-Ug")
        let camera = GMSCameraPosition.camera(withLatitude: 11.3167, longitude: 104.0651, zoom : 15)
        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView?.setMinZoom(10, maxZoom: 17)
        mapView?.settings.compassButton = true
        mapView?.settings.myLocationButton = true
        mapView?.isMyLocationEnabled = true
        view = mapView
        //Map overlay
        let southWest = CLLocationCoordinate2D(latitude: 11.3432, longitude:104.0323 )
        let northEast = CLLocationCoordinate2D(latitude: 11.3040, longitude: 104.0846)
        let overlayBounds = GMSCoordinateBounds(coordinate: southWest, coordinate: northEast)
        let icon = UIImage(named: "vmap")!
        let overlay = GMSGroundOverlay(bounds: overlayBounds, icon: icon)
        overlay.bearing = 0
        overlay.map = mapView
        
        if currentDestination == nil {
            currentDestination = markerLocation.first
        }
        for currentDestination in markerLocation {
            let marker = GMSMarker(position: currentDestination.location)
            marker.title = currentDestination.title
            marker.snippet = currentDestination.dec
            marker.icon = UIImage(named: "marker")
            marker.map = mapView
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
