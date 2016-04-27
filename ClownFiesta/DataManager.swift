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
    var games: [NSManagedObject]!
    
    let gameMode = gameSingleton
    
    var playerName: String
    var playerAge: String
    var playerLocation: String
    var playerScore: Int
    
    private override init() {
        self.playerName = ""
        self.playerAge = ""
        self.playerLocation = ""
        self.playerScore = 0
    }
    
    func saveData(name: String, age: String, location: String, score: String) {
        // Create the Data Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Keep for creation if needed. Create data object to save into context
        let entity =  NSEntityDescription.entityForName("Player", inManagedObjectContext:managedContext)
        var player = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
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
        player.setValue(Int(score), forKey: "score")
        
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
            let result:NSArray? = try managedContext.executeFetchRequest(fetchRequest)
            
            if let res = result {
                    if res.count == 0 {
                        //Do Nothing
                    } else {
                        
                        player = result![0] as! Player
                        print("SWEET FREEDOM!!!", String(player.valueForKey("firstName")!))
                        
                        self.playerName = (player.valueForKey("firstName") as? String)!
                        self.playerAge = (player.valueForKey("age") as? String)!
                        self.playerLocation = (player.valueForKey("location") as? String)!
                        self.playerScore = (player.valueForKey("score") as? Int)!
                }
            }
            
            //Keep for Deleting in case
            for i in result! {
                managedContext.deleteObject(i as! NSManagedObject)
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func saveGame(gameName: String, clueFound: Bool, clueInt: Int, clueScore: Int) {
        // Create the Data Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Keep for creation if needed. Create data object to save into context
        let entity =  NSEntityDescription.entityForName("SavedGame", inManagedObjectContext:managedContext)
        let game = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        playerScore += clueScore
        
        // Set values for the object
        game.setValue(gameName, forKey: "savedGameName")
        game.setValue(clueFound, forKey: "clueFound")
        game.setValue(clueInt, forKey: "clueInt")
        game.setValue(clueScore, forKey: "clueScore")
        
        // Save data
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        print("sour code jesus? ", game.valueForKey("clueFound")!)
        print(game)
        
        
    }
    
    func fetchGame() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "SavedGame")
        
        do {
            let results:NSArray? = try managedContext.executeFetchRequest(fetchRequest)
            games = results as! [NSManagedObject]
            
            if let res = results {
                if res.count == 0 {
                    //Do Nothing
                } else {
                    // Checks through array of results and finds the correct value to set as true.
                    for game in games {
                        if String(game.valueForKey("savedGameName")!) == String((gameMode.currentGameMode?.gameName)!) {
                            for i in 0...(gameMode.currentGameMode?.gameClues.count)! {
                                if String(game.valueForKey("clueInt")!) == String(i) {
                                    gameMode.currentGameMode?.gameClues[Int(i)].clueFound = true
                                }
                            }
                        } else {
                            print("This is the entity name: ", String(game.valueForKey("savedGameName")))
                            print("This is the currentgameName: ", String((gameMode.currentGameMode?.gameName)!))
                        }
                    }
                }
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }

}