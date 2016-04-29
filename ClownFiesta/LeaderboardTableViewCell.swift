//
//  LeaderboardTableViewCell.swift
//  ClownFiesta
//
//  Created by iosdev on 29.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {

  
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var leaderboardImage: UIImageView!
    @IBOutlet weak var playerScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
