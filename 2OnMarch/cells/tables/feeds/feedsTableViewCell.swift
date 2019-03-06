//
//  feedsTableViewCell.swift
//  2OnMarch
//
//  Created by rocky on 2/19/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class feedsTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var imageDesc: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.raduis(setRaduis: 8)
        self.smoothShadow()
    }
    
    func configCell(model: NotificationDataModel){
        self.desc.text = model.Description
        self.title.text = model.Name
        self.time.text = model.Time
        if model.PhotoUrl != nil {
            self.imageDesc.findMe(url: model.PhotoUrl, raduis: false)
        }else {
            self.imageDesc.isHidden = true
        }
    }
    
    func configCellForAnnounceMent(model: AnnouncementsDataModel){
        self.desc.text = model.Description
        self.title.text = model.Name
        self.time.text = model.Time
        if model.PhotoUrl != nil {
            self.imageDesc.findMe(url: model.PhotoUrl, raduis: false)
        }else {
            self.imageDesc.isHidden = true 
        }
    }
    
}
