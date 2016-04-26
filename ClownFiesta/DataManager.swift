//
//  DataController.swift
//  ClownFiesta
//
//  Created by iosdev on 25.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import Foundation
import UIKit
import CoreData

let dataManager = DataManager()
class DataManager: NSObject {
    // MARK: Properties
    
    var player: Player!
    
    var playerName: String
    var playerAge: String
    var playerLocation: String
    
    private override init() {
        self.playerName = ""
        self.playerAge = ""
        self.playerLocation = ""
    }
    
    func saveData(name: String, age: String, location: String) {
        // Create the Data Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Keep for creation if needed. Create data object to save into context
        /* let entity =  NSEntityDescription.entityForName("Player", inManagedObjectContext:managedContext)
        let player = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext) */
        
        let fetchRequest = NSFetchRequest(entityName: "Player")
        
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            player = result[0] as! Player
            print("FETCH FREEDOM!!!")
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        // Set values for the object
        player.setValue(name, forKey: "firstName")
        player.setValue(age, forKey: "age")
        player.setValue(location, forKey: "location")
        
        // Save data
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        print("SWEET CODE JESUS", player.valueForKey("firstName")!)
        print(player)
    }
    
    func fetchUser() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Player")
        
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            
            //Keep for Deleting in case
            /* for i in result {
            managedContext.deleteObject(i as! NSManagedObject)
            } */
            
            player = result[0] as! Player
            print("SWEET FREEDOM!!!", String(player.valueForKey("firstName")!))
            
            self.playerName = (player.valueForKey("firstName") as? String)!
            self.playerAge = (player.valueForKey("age") as? String)!
            self.playerLocation = (player.valueForKey("location") as? String)!
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    

}