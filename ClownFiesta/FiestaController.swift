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
    @IBOutlet weak var fiestaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animate() {
        
        let changeColor = CATransition()
        changeColor.type = kCATransitionFade
        changeColor.duration = 1.0
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            self.fiestaLabel.textColor = UIColor.orangeColor()
            self.fiestaLabel.layer.addAnimation(changeColor, forKey: nil)
        }
        self.fiestaLabel.textColor = UIColor.yellowColor()
        self.fiestaLabel.layer.addAnimation(changeColor, forKey: nil)
        
        CATransaction.commit()
    }

}