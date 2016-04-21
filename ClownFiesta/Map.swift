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


class Map: NSObject, CLLocationManagerDelegate{
    // MARK: Properties

    let locationManager = CLLocationManager()
    var currentLatitude: Double = 0.0
    var currentLongitude: Double = 0.0
    let regionRadius: CLLocationDistance = 1000
    
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

    /* Keep for later development (unused method)
    func openMap(){
        
        let lat1 : NSString = String(currentLatitude)
        let lng1 : NSString = String(currentLongtitude)
        
        let latitude:CLLocationDegrees =  lat1.doubleValue
        let longtitude:CLLocationDegrees =  lng1.doubleValue
        
        currentLatitude = latitude
        currentLongtitude = longtitude
        
        let coordinate = CLLocationCoordinate2DMake(latitude, longtitude)
        
        let placemark : MKPlacemark = MKPlacemark(coordinate: coordinate, addressDictionary:nil)
        
        let mapItem:MKMapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = "Your current location"
        
        let launchOptions:NSDictionary = NSDictionary(object: MKLaunchOptionsDirectionsModeDriving, forKey: MKLaunchOptionsDirectionsModeKey)
        
        let currentLocationMapItem:MKMapItem = MKMapItem.mapItemForCurrentLocation()
        
        MKMapItem.openMapsWithItems([currentLocationMapItem, mapItem], launchOptions: launchOptions as! [String : AnyObject])
    }
    */
    
}