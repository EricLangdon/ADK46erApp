//
//  HikeItemCell.swift
//  adk46er
//
//  Created by Eric Langdon on 3/22/20.
//  Copyright © 2020 Eric Langdon. All rights reserved.
//

import UIKit

class HikeItemCell : UITableViewCell {
    
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var serNumLabel : UILabel!
    @IBOutlet var valueLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serNumLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
}
