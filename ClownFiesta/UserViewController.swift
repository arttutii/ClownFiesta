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
    let dataControl = dataManager
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
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
        
        // Get user from device data storage
        dataControl.fetchUser()
        
        // Set textfields as the received data
        nameTextField.text = dataControl.playerName
        ageTextField.text = dataControl.playerAge
        locationTextField.text = dataControl.playerLocation
        scoreLabel.text = dataControl.playerScore
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func saveUser(sender: AnyObject) {
        dataControl.saveData(nameTextField.text!, age: ageTextField.text!, location: locationTextField.text!, score: scoreLabel.text!)
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