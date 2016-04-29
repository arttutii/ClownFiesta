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
    var newTeam: Team!
    var games: [NSManagedObject]!
    var teams: [NSManagedObject]!
    
    let gameMode = gameSingleton
    
    var teamName: String!
    var teamMembers: [String]! = []
    var memberCheck: Bool?
    var currentTeam: String!
    
    var playerName: String!
    var playerAge: String!
    var playerLocation: String!
    var playerScore: Int
    
    private override init() {
        self.playerName = ""
        self.playerAge = ""
        self.playerLocation = ""
        self.playerScore = 0
    }
    
    // This function is ran only the first time the application is launched
    // Saves user's data
    func saveFirstData(name: String, age: String, location: String, score: String) {
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
            print("First User's data fetched")
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
        print("First Fetched username:", player.valueForKey("firstName")!)
        print(player)
    }
    
    // This is the main function when saving user's data into the core
    func saveData(name: String, age: String, location: String, score: String) {
        // Create the Data Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Keep for creation if needed. Create data object to save into context
        //let entity =  NSEntityDescription.entityForName("Player", inManagedObjectContext:managedContext)
        //var player = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        let fetchRequest = NSFetchRequest(entityName: "Player")
        
        do {
            let result = try managedContext.executeFetchRequest(fetchRequest)
            player = result[0] as! Player
            print("User's data fetched")
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
        print("Fetched username:", player.valueForKey("firstName")!)
        print(player)
    }
    
    // Gets the user from core data
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
                    print("Fetched username:", String(player.valueForKey("firstName")!))
                    
                    self.playerName = (player.valueForKey("firstName") as? String)!
                    self.playerAge = (player.valueForKey("age") as? String)!
                    self.playerLocation = (player.valueForKey("location") as? String)!
                    self.playerScore = (player.valueForKey("score") as? Int)!
                }
            }
            
            //Keep for Deleting in case
            /*for i in result! {
                managedContext.deleteObject(i as! NSManagedObject)
            }*/
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    // Saves the game objects as entities and is used to track the progress of found clues
    func saveGame(gameName: String, clueFound: Bool, clueInt: Int, clueScore: Int) {
        // Create the Data Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Keep for creation if needed. Create data object to save into context
        let entity =  NSEntityDescription.entityForName("SavedGame", inManagedObjectContext:managedContext)
        let game = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
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
        print(game)
        
        
    }
    
    // Gets the games from core data
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
                                    gameMode.currentGameMode?.gameClues[Int(i)].clueFound = Bool(Int(game.valueForKey("clueFound")! as! NSNumber))
                                    gameMode.currentGameMode?.gameClues[Int(i)].clueScore = Int(game.valueForKey("clueScore")! as! NSNumber)
                                }
                            }
                        } else {
                            print("This is the entity name: ", String(game.valueForKey("savedGameName")!))
                            print("This is the currentgameName: ", String((gameMode.currentGameMode?.gameName)!))
                        }
                    }
                }
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
    // Save team into core data
    func saveTeam(teamName: String, memberName: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Team")
        
        do {
            let result:NSArray? = try managedContext.executeFetchRequest(fetchRequest)
            
            if let res = result {
                if res.count == 0 {
                    let entity =  NSEntityDescription.entityForName("Team", inManagedObjectContext:managedContext)
                    let team = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
                    
                    team.setValue(currentTeam, forKey: "teamName")
                    team.setValue(playerName, forKey: "memberName")

                } else {
                    newTeam = result![0] as! Team
                    if String(newTeam.valueForKey("teamName")!) == currentTeam {
                        newTeam.setValue(playerName, forKey: "memberName")
                    } else {
                        //Keep for Deleting in case
                        newTeam.setValue(teamName, forKey: "teamName")
                        newTeam.setValue(memberName, forKey: "memberName")
                    }
                }
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        do {
            // Save the context into core
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        print("Hello, Team has been saved!")
        
    }
    func addMemberToTeam(teamName: String, newTeamMember: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Team")
        
        do {
            let result:NSArray? = try managedContext.executeFetchRequest(fetchRequest)
            
            if let res = result {
                    let entity =  NSEntityDescription.entityForName("Team", inManagedObjectContext:managedContext)
                    let team = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
                // Search through teams and look if the new team member is already in the team
                for teams in result! {
                    print("Going through:",teams.valueForKey("teamName")!, " --- Current team:",currentTeam)
                    if String(teams.valueForKey("teamName")!) == currentTeam {
                        if String(teams.valueForKey("memberName")) == newTeamMember{
                            memberCheck = true
                        } else {
                            memberCheck = false
                        }
                    }
                }
                // If new team member was not found, add him to the team. If found, do nothing.
                if memberCheck == false {
                    team.setValue(teamName, forKey: "teamName")
                    team.setValue(newTeamMember, forKey: "memberName")
                    teamMembers.append(newTeamMember)
                    print("New member '\(newTeamMember)' added to the team.")
                } else {
                    print("No team members added. Given teamMember already exists in a team.")
                }
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        do {
            // Save the context into core
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    
    }
    
    // Get team from core data
    func fetchTeam() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Team")
        
        teamMembers = []
        
        do {
            let results:NSArray? = try managedContext.executeFetchRequest(fetchRequest)
            teams = results as! [NSManagedObject]
            
            if let res = results {
                if res.count == 0 {
                    //Do Nothing
                } else {
                    // Checks through array of results and finds the correct value to set as true.
                    for team in teams {
                        teamMembers.append(String(team.valueForKey("memberName")!))
                    }
                    self.currentTeam = String(teams[0].valueForKey("teamName")!)
                }
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        print("Hello, team has been fetched!")
    }
    
    
}