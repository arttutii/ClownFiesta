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
    
    let asd = BeaconSingleton.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        print(beacons)
        
    }
    
}
