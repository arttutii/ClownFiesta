//
//  ClueFoundViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 22.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class ClueFoundViewController: UIViewController {

    let dataControl = dataManager
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background of View
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "YellowAppBackground")!)
        navigationItem.hidesBackButton = true
        
        // Display the Player's current score after finding the beacon.
        scoreLabel.text = String(dataControl.playerScore)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToGames(sender: AnyObject) {
        performSegueWithIdentifier("backToGames", sender: self)
    }
}
