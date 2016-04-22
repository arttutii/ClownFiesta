//
//  ClueTableViewCell.swift
//  ClownFiesta
//
//  Created by iosdev on 12.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit

class ClueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var clueLabel: UILabel!
    @IBOutlet weak var clueFoundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
