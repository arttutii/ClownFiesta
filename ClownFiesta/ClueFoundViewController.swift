//
//  ClueFoundViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 22.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class ClueFoundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //Background of View
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "YellowAppBackground")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToGames(sender: AnyObject) {
        performSegueWithIdentifier("backToGamesSegue", sender: self)
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
