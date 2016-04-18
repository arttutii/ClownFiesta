//
//  MapController.swift
//  ClownFiesta
//
//  Created by iosdev on 7.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

import CoreLocation
import MapKit

class MapController: UIViewController, CLLocationManagerDelegate{
    
    // MARK: Properties
    let AppMap =  Map()
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    var locationCheck: Bool = false
   
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    // Set the mapview's visible area
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        AppMap.currentLatitude = locValue.latitude
        AppMap.currentLongtitude = locValue.longitude
        let initialLocation = CLLocation(latitude: AppMap.currentLatitude, longitude: AppMap.currentLongtitude)
        
        //Check if location is Initial and center only once
        if locationCheck == false {
            centerMapOnLocation(initialLocation)
            locationCheck = true
        } else {
            // Do nothing
        }
    }
    
}