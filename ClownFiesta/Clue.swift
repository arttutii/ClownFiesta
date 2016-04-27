//
//  Clue.swift
//  ClownFiesta
//
//  Created by iosdev on 8.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation

class Clue {

    var clueDescription: String
    var beaconMinor: Int
    var beaconMajor: Int
    var clueScore: Int
    var clueFound: Bool
    let beaconLatitude: Double
    let beaconLongitude: Double
    
    init(des: String, bMinor: Int, bMajor: Int, lat: Double, long: Double) {
        self.clueDescription = des
        self.beaconMajor = bMajor
        self.beaconMinor = bMinor
        self.beaconLatitude = lat
        self.beaconLongitude = long
        self.clueScore = 50
        self.clueFound = false
    }
}
