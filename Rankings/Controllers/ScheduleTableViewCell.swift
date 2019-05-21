//
//  DetailTableViewCell.swift
//  Rankings
//
//  Created by Eric Carroll on 5/13/19.
//  Copyright © 2019 Eric Carroll. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    @IBOutlet weak var oppLabel: UILabel!
    @IBOutlet weak var score1Label: UILabel!
    @IBOutlet weak var score2Label: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let labelAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple]
        let labelString = NSAttributedString(string: locationLabel.text!, attributes: labelAttributes)
        locationLabel.attributedText = labelString
        // Configure the view for the selected state
    }

}
