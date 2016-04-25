//
//  Beacon.swift
//  ClownFiesta
//
//  Created by iosdev on 21.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation

class Beacon {
    
    let beaconMinorValue: Int
    let beaconMajorValue: Int
    let beaconLatitude: Double
    let beaconLongitude: Double

    init(minor: Int, major: Int, lat: Double, long: Double) {
        self.beaconMajorValue = major
        self.beaconMinorValue = minor
        self.beaconLatitude = lat
        self.beaconLongitude = long
    }
    

}