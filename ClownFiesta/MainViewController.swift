//
//  ViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 5.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    // MARK: Properties
    
    let detector:BeaconDetective = detectorSingleton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Background of View
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "AppBackground")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}