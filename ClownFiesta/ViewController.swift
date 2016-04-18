//
//  ViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 5.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: Properties
    let locationManager = CLLocationManager()
    
    let rangingRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "00000000-0000-0000-0000-000000000000")!, identifier: "Beacons")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeaconsInRegion(rangingRegion)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.Unknown }
        let closestBeacon = knownBeacons[0] as CLBeacon
        
        print(beacons)
        
    }
    
}
