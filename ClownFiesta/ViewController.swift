//
//  ViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 5.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate{
    
    // MARK: Properties
    
    let AppMap =  Map()
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var teamButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        teamButton.layer.borderWidth = 1
        teamButton.layer.borderColor = UIColor.blackColor().CGColor
        
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
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        AppMap.currentLatitude = locValue.latitude
        AppMap.currentLongtitude = locValue.longitude
    }
    
    // MARK: Actions
    @IBAction func teamButton(sender: UIButton) {
        AppMap.openMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Disable screen orientation
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    

}

