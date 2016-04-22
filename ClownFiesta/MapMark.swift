//
//  MapMark.swift
//  ClownFiesta
//
//  Created by iosdev on 21.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation
import MapKit

class MapMark: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }
    
}