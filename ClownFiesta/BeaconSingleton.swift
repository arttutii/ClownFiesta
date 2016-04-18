//
//  BeaconSingleton.swift
//  ClownFiesta
//
//  Created by iosdev on 18.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation
class BeaconSingleton: NSObject {
    
    class var sharedInstance: BeaconSingleton {
        struct Singleton {
            static let instance = BeaconSingleton()
        }
        return Singleton.instance
    }
    
}