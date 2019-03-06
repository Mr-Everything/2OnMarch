//
//  calenderTableViewCell.swift
//  2OnMarch
//
//  Created by rocky on 2/23/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class calenderTableViewCell: UITableViewCell {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var speakerLabel: UILabel!
    @IBOutlet weak var isFavorite: UIButton!
    
    var closure: ( () -> () )?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        smoothShadow()
    }
    
    func configCell(model: AgendaDataModel){
        self.header.text = model.Name
        self.timeLabel.text = model.TimeForm! + " - " + model.TimeTo!
        self.locationLabel.text = model.Location
        var totalSpeakerName = ""
        
        for (index, speaker) in model.Speakers.enumerated() {
            if index == model.Speakers.count {
                totalSpeakerName += speaker.Name!
            }else {
                totalSpeakerName += speaker.Name! + ", "
            }
        }
        
        if model.IsFavorite == true {
            self.isFavorite.setImage(UIImage(named: "sstar"), for: .normal)
        }else {
            self.isFavorite.setImage(UIImage(named: "star"), for: .normal)
        }
        self.speakerLabel.text = totalSpeakerName
    }
    
    @IBAction func favorite(_ sender: UIButton) {
        closure?()
    }
    
}
