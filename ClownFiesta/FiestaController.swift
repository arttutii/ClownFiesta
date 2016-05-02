//
//  FiestaController.swift
//  ClownFiesta
//
//  Created by iosdev on 7.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit
import AVFoundation

class FiestaController: UIViewController {

    // MARK: Properties
    
    let gameMode:GameController = gameSingleton
    let detector = detectorSingleton
    
    @IBOutlet var fiestaImageView: UIImageView!
    @IBOutlet weak var fiestaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the gamemodes
        gameMode.loadGameModes()
        
        // Request authorization to use bluetooth
        detector.getAuthorization()
        
        // Possible animations and sound effects as an improvement to the fiesta.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}