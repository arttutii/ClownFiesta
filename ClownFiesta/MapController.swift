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

class MapController: UIViewController, CLLocationManagerDelegate, BeaconProtocol {
    
    // MARK: Properties
    let AppMap =  Map()
    let detector:BeaconDetective = detectorSingleton
    let gameMode: GameController = gameSingleton
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    var locationCheck: Bool = false
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NOT DONE YET, IF CHECK HAS TO BE FROM THE CLUECONTROLLER BUTTON ACTION
        if gameMode.currentClue != nil {
            placeMapPin(gameMode.currentClue!.clueDescription, latitude: gameMode.currentClue!.beaconLatitude, longitude: gameMode.currentClue!.beaconLongitude)
        }
        //registerAsObserver()
        
        // Ask for Authorization from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        // If authorization is granted, start the location manager
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
    // Place clue's location with a pin on MapView
    func placeMapPin(clueName: String,latitude: Double, longitude: Double){
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let pin = MapMark(title: clueName, coordinate: coordinate)
        mapView.addAnnotation(pin)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        AppMap.currentLatitude = locValue.latitude
        AppMap.currentLongitude = locValue.longitude
        let initialLocation = CLLocation(latitude: AppMap.currentLatitude, longitude: AppMap.currentLongitude)
        
        //Check if location is Initial and center only once
        if locationCheck == false {
            centerMapOnLocation(initialLocation)
            locationCheck = true
        } else {
            // Do nothing
        }
    }
    
    func registerAsObserver() {
        detector.observerViews.append(self)
    }
    
    func notifyObserver() {
        performSegueWithIdentifier("ClueFoundSegue", sender: self)
    }
    
}