//
//  Player+CoreDataProperties.swift
//  ClownFiesta
//
//  Created by iosdev on 26.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Player {

    @NSManaged var age: String?
    @NSManaged var firstName: String?
    @NSManaged var location: String?
    @NSManaged var score: NSNumber?
    
}
