//
//  ClueController.swift
//  ClownFiesta
//
//  Created by iosdev on 19.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class ClueController: UIViewController, BeaconProtocol {
    
    // MARK: Properties
    
    let detector:BeaconDetective = detectorSingleton
    
    @IBOutlet weak var clueLocation: UILabel!
    @IBOutlet weak var clueText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerAsObserver()

        // Do any additional setup after loading the view.
        //View Background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "RedAppBackground")!)
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Clues", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
        
        clueLocation.text = gameSingleton.currentGameMode?.gameLocation
        clueText.text = gameSingleton.currentClue?.clueDescription
        
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
        print("hello")
    }
    
    // MARK: Actions
    
    @IBAction func unlockHintOnMap(sender: AnyObject) {
        performSegueWithIdentifier("ClueFoundSegue", sender: self)
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
