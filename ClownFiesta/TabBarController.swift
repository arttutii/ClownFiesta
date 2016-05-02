//
//  TabBarController.swift
//  ClownFiesta
//
//  Created by iosdev on 25.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit


class TabBarController: UITabBarController {
    
    // This custom controller is required for the use of a custom navigation button 
    // so that the navigation in our application works correctly.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hides the navigation back button and create custom push button in navigation bar
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Game Modes", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
    }
    
    func back(sender: UIBarButtonItem) {
        performSegueWithIdentifier("cluesToGames", sender: self)
    }
}
