//
//  ClueController.swift
//  ClownFiesta
//
//  Created by iosdev on 19.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class ClueController: UIViewController{
    
    // MARK: Properties
    
    // Instances of classes
    let detector:BeaconDetective = detectorSingleton
    let gameMode = gameSingleton
    let dataControl = dataManager
    
    @IBOutlet weak var clueLocation: UILabel!
    @IBOutlet weak var clueText: UITextView!
    @IBOutlet weak var clueScoreLabel: UILabel!
    @IBOutlet weak var unlockButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // View Background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "RedAppBackground")!)
        
         // Hides the navigation back button and create custom push button in navigation bar
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Clues", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
        
        clueLocation.text = gameSingleton.currentGameMode?.gameLocation
        clueText.text = gameSingleton.currentClue?.clueDescription
        clueScoreLabel.text = String((gameSingleton.currentClue?.clueScore)!)
        
        if gameMode.currentClue?.clueFound == true {
            unlockButton.hidden = true
        } else {
            unlockButton.hidden = false
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(sender: UIBarButtonItem) {
        performSegueWithIdentifier("clueToClues", sender: self)
    }
    
    // MARK: Actions
    
     @IBAction func unlockHintOnMap(sender: AnyObject) {
        // Create an alert pop up.
        let alertController = UIAlertController(title: "Are you sure?", message: "Revealing the clue on the map reduces the clue score by 20.", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action:UIAlertAction!) in
            // Close Alert
        }
        
        let OKAction = UIAlertAction(title: "Yes", style: .Default) { (action:UIAlertAction!) in
            // Deduction of the score after use of the hint
            if self.gameMode.currentClue?.clueScore >= 20 {
                self.gameMode.currentClue?.clueScore -= 20
            } else {
                self.gameMode.currentClue?.clueScore = 0
            }
            self.clueScoreLabel.text = String((gameSingleton.currentClue?.clueScore)!)
            // Save the game after the change to the clueScore to store the new clueScore value in Core Data.
            self.dataControl.saveGame((self.gameMode.currentGameMode?.gameName)!, clueFound: (self.gameMode.currentClue?.clueFound)!, clueInt: (self.gameMode.currentClueInt)!, clueScore: (self.gameMode.currentClue?.clueScore)! )
            self.performSegueWithIdentifier("clueToMap", sender: self)
        }
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion:nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
