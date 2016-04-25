//
//  TabBarController.swift
//  ClownFiesta
//
//  Created by iosdev on 25.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit


class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Game Modes", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
    }
    
    func back(sender: UIBarButtonItem) {
        performSegueWithIdentifier("cluesToGames", sender: self)
    }
}
