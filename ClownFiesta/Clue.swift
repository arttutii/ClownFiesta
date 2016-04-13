//
//  Clue.swift
//  ClownFiesta
//
//  Created by iosdev on 8.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//
import Foundation

class Clue {

    var ClueDescription: String
    var ClueStart: NSDate
    var ClueEnd: NSDate
    
    
    init(ClueDescription: String) {
        self.ClueDescription = ClueDescription
        self.ClueStart = NSDate()
        self.ClueEnd = NSDate()
    }
}
