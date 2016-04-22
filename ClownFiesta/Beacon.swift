//
//  Beacon.swift
//  ClownFiesta
//
//  Created by iosdev on 21.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation

class Beacon{
    // MARK: Properties
    let beaconMinorValue: Int
    let beaconMajorValue: Int

    init(minor: Int, major: Int) {
        self.beaconMajorValue = major
        self.beaconMinorValue = minor
    }

}