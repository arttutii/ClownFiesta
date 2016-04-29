//
//  TeamProtocol.swift
//  ClownFiesta
//
//  Created by iosdev on 29.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation

// Observer pattern for notifying views when a team is created 

protocol TeamProtocol {
    func registerAsObserver()
    func notifyObserver()
}