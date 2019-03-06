//
//  interestesTableViewCell.swift
//  2OnMarch
//
//  Created by rocky on 2/18/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class interestesTableViewCell: UITableViewCell {

    @IBOutlet weak var interest: UILabel!
    
    var choosed: ( () -> () )?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func clicked(_ sender: UIButton) {
        choosed?()
    }
    
}
