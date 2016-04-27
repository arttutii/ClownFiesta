//
//  SavedGame+CoreDataProperties.swift
//  ClownFiesta
//
//  Created by iosdev on 27.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension SavedGame {

    @NSManaged var savedGameName: String?
    @NSManaged var clueFound: NSNumber?
    @NSManaged var clueInt: NSNumber?
    @NSManaged var clueScore: NSNumber?

}
