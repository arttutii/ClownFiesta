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
    var clueFound: Bool
    var clueStart: NSDate
    var clueEnd: NSDate
    
    init(des: String, bMinor: Int, bMajor: Int) {
        self.clueDescription = des
        self.beaconMajor = bMajor
        self.beaconMinor = bMinor
        self.clueStart = NSDate()
        self.clueEnd = NSDate()
        self.clueFound = false
    }
}
