//
//  TeamViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 21.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit
import CoreLocation

let teamSingleton = TeamViewController()

class TeamViewController: UIViewController, UITextFieldDelegate, BeaconProtocol  {
    
    // MARK: Properties
    var teamObservers = [TeamProtocol]()
    let detector:BeaconDetective = detectorSingleton
    let dataControl = dataManager
    
    var addMemberField: String?
    
   
    @IBOutlet weak var teamNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //registerAsObserver()
        
        teamNameField.delegate = self
        teamNameField.autocapitalizationType = .Sentences
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

        teamNameField.text = dataControl.currentTeam
        
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
        dataControl.saveTeam(dataControl.currentTeam, memberName: dataControl.playerName)
        print("--------------------",dataControl.currentTeam, dataControl.playerName)
        dataControl.fetchTeam()
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
    }
    
    // MARK: Actions
    
    @IBAction func addMembersBtn(sender: AnyObject) {
        let alert = UIAlertView()
        addMemberField? = String(alert.textFieldAtIndex(0))
        
        // dataControl.saveTeam(dataControl.currentTeam, memberName: addMemberField!)
        alert.title = "Enter Input"
        alert.addButtonWithTitle("Done")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.addButtonWithTitle("Cancel")
        alert.show()
    }
    
    // Go through the array of observer ViewControllers and call their notify method
    func notifyObserverViews() {
        print("CALL FUCK")
        for i in teamObservers {
            i.notifyObserver()
        }
        print(String(teamObservers))
    }

}
