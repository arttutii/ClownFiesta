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
    var player = [NSManagedObject]()
    
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
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Player")
        
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            player = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
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
        
        // Create data object to save into context
        let entity =  NSEntityDescription.entityForName("Player", inManagedObjectContext:managedContext)
        let thePlayer = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        // Set values for the object
        thePlayer.setValue(name, forKey: "firstName")
        thePlayer.setValue(age, forKey: "age")
        thePlayer.setValue(location, forKey: "location")
        
        // Save data
        do {
            try managedContext.save()
            player.append(thePlayer)
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        print(player)
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
