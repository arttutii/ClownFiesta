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
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
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
        scoreLabel.text = String(dataControl.playerScore)
        
        dataControl.saveFirstData(dataControl.playerName, age: dataControl.playerAge, location: dataControl.playerLocation, score: String(dataControl.playerScore))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func saveUser(sender: AnyObject) {
        dataControl.saveData(nameTextField.text!, age: ageTextField.text!, location: locationTextField.text!, score: String(dataControl.playerScore))
        dataControl.fetchUser()
        let alert = UIAlertView(title: "User", message: "User Saved", delegate: nil, cancelButtonTitle: nil)
        alert.show()
        
        let delay = 1.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func registerAsObserver() {
        detector.observerViews.append(self)
    }
    
    func notifyObserver() {
        performSegueWithIdentifier("ClueFoundSegue", sender: self)
    }
}