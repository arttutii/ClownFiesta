//
//  GameViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 8.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BeaconProtocol {

    // MARK: Properties
    @IBOutlet weak var modeLabel: UILabel!
    
    let detector:BeaconDetective = detectorSingleton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerAsObserver()
        
        //Background of View
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "GreenAppBackground")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.s
    }
    
    func registerAsObserver() {
        detector.observerViews.append(self)
    }
    
    func notifyObserver() {
        performSegueWithIdentifier("ClueFoundSegue", sender: self)
    }
    
}
