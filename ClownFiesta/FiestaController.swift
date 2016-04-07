//
//  FiestaController.swift
//  ClownFiesta
//
//  Created by iosdev on 7.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//


import UIKit

class FiestaController: UIViewController {

    // MARK: Properties
    
    @IBOutlet var fiestaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: Actions
    @IBAction func tapGesture(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("fiestaPush", sender: nil)
        print("hello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Disable screen orientation
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }

}