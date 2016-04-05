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
    var currentLongtitude: Double = 0.0
    
    func openMap(){
        
        let lat1 : NSString = String(currentLatitude)
        let lng1 : NSString = String(currentLongtitude)
        
        let latitute:CLLocationDegrees =  lat1.doubleValue
        let longitute:CLLocationDegrees =  lng1.doubleValue
        
        let coordinate = CLLocationCoordinate2DMake(latitute, longitute)
        
        let placemark : MKPlacemark = MKPlacemark(coordinate: coordinate, addressDictionary:nil)
        
        let mapItem:MKMapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = "Your current location"
        
        let launchOptions:NSDictionary = NSDictionary(object: MKLaunchOptionsDirectionsModeDriving, forKey: MKLaunchOptionsDirectionsModeKey)
        
        let currentLocationMapItem:MKMapItem = MKMapItem.mapItemForCurrentLocation()
        
        MKMapItem.openMapsWithItems([currentLocationMapItem, mapItem], launchOptions: launchOptions as! [String : AnyObject])
        
    }
    
    
    
    
}