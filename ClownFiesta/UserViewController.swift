//
//  UserViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 21.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class UserViewController: UIViewController, UITextFieldDelegate, BeaconProtocol {
    
    // MARK: Properties
    let detector:BeaconDetective = detectorSingleton
    var player: Player!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //registerAsObserver()
        
        // Set delegates
        nameTextField.delegate = self
        nameTextField.autocapitalizationType = .Sentences
        ageTextField.delegate = self
        ageTextField.keyboardType = .NumberPad
        locationTextField.delegate = self
        locationTextField.autocapitalizationType = .Sentences
        
        //Background of View
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "RedAppBackground")!)
        fetchUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func saveUser(sender: AnyObject) {
        saveData(nameTextField.text!, age: ageTextField.text!, location: locationTextField.text!)
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
            
            nameTextField.text = player.valueForKey("firstName")! as? String
            ageTextField.text = player.valueForKey("age")! as? String
            locationTextField.text = player.valueForKey("location") as? String
            
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func registerAsObserver() {
        detector.observerViews.append(self)
    }
    
    func notifyObserver() {
        performSegueWithIdentifier("ClueFoundSegue", sender: self)
    }
}