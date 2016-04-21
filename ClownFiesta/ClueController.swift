//
//  ClueController.swift
//  ClownFiesta
//
//  Created by iosdev on 19.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class ClueController: UIViewController {
    
    // MARK: Properties
    let gameMode: GameController = gameSingleton
    
    @IBOutlet weak var clueLocation: UILabel!
    @IBOutlet weak var clueText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //View Background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "YellowAppBackground")!)
        
        
        clueLocation.text = gameMode.currentGameMode?.gameLocation
        clueText.text = gameMode.currentClue?.ClueDescription
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func unlockHintOnMap(sender: AnyObject) {
        
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
