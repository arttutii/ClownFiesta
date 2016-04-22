//
//  BeaconProtocol.swift
//  ClownFiesta
//
//  Created by iosdev on 18.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation

// Observer pattern for notifying views when a beacon is found

protocol BeaconProtocol {
    func registerAsObserver()
    func notifyObserver()
}