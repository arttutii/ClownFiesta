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
    
    
    init(des: String) {
        self.ClueDescription = des
        self.ClueStart = NSDate()
        self.ClueEnd = NSDate()
    }
}
