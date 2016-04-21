//
//  MapController.swift
//  ClownFiesta
//
//  Created by iosdev on 7.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapController: UIViewController{
    
    // MARK: Properties
    let gameMode: GameController = gameSingleton
    var locationCheck: Bool = false
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameMode.appMap.askAuthorization()
        let initialLocation = CLLocation(latitude: gameMode.appMap.currentLatitude, longitude: gameMode.appMap.currentLongitude)

        //Check if location is Initial and center only once
        if locationCheck == false {
            self.centerMapOnLocation(initialLocation)
            locationCheck = true
        } else {
            // Do nothing
        }

    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    // Set the mapview's visible area
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius = gameMode.appMap.regionRadius
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
}