//
//  activityTableViewCell.swift
//  2OnMarch
//
//  Created by Kamal on 3/5/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class activityTableViewCell: UITableViewCell {

    @IBOutlet weak var activityName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
