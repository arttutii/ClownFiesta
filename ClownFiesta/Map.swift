//
//  Map.swift
//  ClownFiesta
//
//  Created by iosdev on 5.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class Map{
    // MARK: Properties
    
    let locationManager = CLLocationManager()
    var currentLatitude: Double = 0.0
    var currentLongitude: Double = 0.0
    
    init() {
        self.currentLongitude = 0.0
        self.currentLatitude = 0.0
    }
    
    func placeMarker() {
        
        let coordinate = CLLocationCoordinate2DMake(currentLatitude, currentLongitude)
        
        let placemark : MKPlacemark = MKPlacemark(coordinate: coordinate, addressDictionary:nil)
        
        let mapItem:MKMapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = "Hint Location"
        
    }

}