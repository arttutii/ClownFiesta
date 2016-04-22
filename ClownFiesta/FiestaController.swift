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
    
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet var fiestaImageView: UIImageView!
    @IBOutlet weak var fiestaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // playBackgroundMusic()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   /* func playBackgroundMusic() {
        do {
            if let bundle = NSBundle.mainBundle().pathForResource("Yeehah", ofType: "mp3") {
                let alertSound = NSURL(fileURLWithPath: bundle)
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try AVAudioSession.sharedInstance().setActive(true)
                try audioPlayer = AVAudioPlayer(contentsOfURL: alertSound)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            }
        } catch {
            print(error)
        }
    }*/

}