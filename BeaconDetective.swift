//
//  BeaconDetective.swift
//  ClownFiesta
//
//  Created by iosdev on 18.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation
import CoreLocation

let detectorSingleton = BeaconDetective()

class BeaconDetective:NSObject, CLLocationManagerDelegate{
    
    // MARK: Properties
    
    let locationManager = CLLocationManager()
    let rangingRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "00000000-0000-0000-0000-000000000000")!, identifier: "Beacons")
    
    private override init(){
        super.init()
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.delegate = self
        locationManager.startRangingBeaconsInRegion(rangingRegion)

    }
    
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.Unknown }
       
        if (knownBeacons.count > 0) {
            let closestBeacon = knownBeacons[0] as CLBeacon
            if closestBeacon.proximity.rawValue <= 1 {
                print(closestBeacon)
            } else {
                // hello
            }
            
        }
        
    }
    
}