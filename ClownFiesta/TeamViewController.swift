//
//  TeamViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 21.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit
import CoreLocation

class TeamViewController: UIViewController, UITextFieldDelegate, BeaconProtocol  {
    
    // MARK: Properties
    let detector:BeaconDetective = detectorSingleton
    let dataControl = dataManager
    
    @IBOutlet weak var teamNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //registerAsObserver()
        
        teamNameField.delegate = self
        teamNameField.autocapitalizationType = .Sentences
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

        
        //Background of View
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BlueAppBackground")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerAsObserver() {
        detector.observerViews.append(self)
    }
    
    func notifyObserver() {
        performSegueWithIdentifier("ClueFoundSegue", sender: self)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        dataControl.currentTeam = teamNameField.text!
        print("currentTeamName : ", teamNameField.text!)
    }

}
