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

class BeaconDetective:NSObject, CLLocationManagerDelegate {
    
    // MARK: Properties
    var observerViews = [BeaconProtocol]()
    var beaconFound: Bool = false
    let gameMode: GameController = gameSingleton
    let dataControl = dataManager
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
            if closestBeacon.proximity.rawValue <= 2 {
                if closestBeacon.minor.integerValue == gameMode.currentClue?.beaconMinor &&
                    closestBeacon.major.integerValue == gameMode.currentClue?.beaconMajor {
                        // confirm clue as Located & mark the clue as Found
                        print("Beacon Found")
                        if gameMode.currentClue?.clueFound == false {
                            gameMode.currentClue?.clueFound = true
                            // Save the Game
                            dataControl.saveGame((gameMode.currentGameMode?.gameName)!, clueFound: (gameMode.currentGameMode?.gameClues[gameMode.currentClueInt!].clueFound)!, clueInt: (gameMode.currentClueInt)!, clueScore: (gameMode.currentClue?.clueScore)! )
                            // Add clueScore to the playerscore
                            dataControl.playerScore += (gameMode.currentClue?.clueScore)!
                            // Save the User Data
                            dataControl.saveData(dataControl.playerName, age: dataControl.playerAge, location: dataControl.playerLocation, score: String(dataControl.playerScore))
                            notifyObserverViews()
                        } else {
                            print("Current clue's clueFound value is true, game is not saved.")
                        }
                        
                }
            } else {
                // Do nothing since beacon is not close enough to the device.
            }
            
        }
    }
    
    func getAuthorization() {
        // Ask for Authorization from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        // If authorization is granted, start the location manager
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    
    // Go through the array of observer ViewControllers and call their notify method
    func notifyObserverViews() {
        for i in observerViews {
            i.notifyObserver()
        }
    }
}