//
//  makerTableViewCell.swift
//  2OnMarch
//
//  Created by Kamal on 3/5/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class makerTableViewCell: UITableViewCell {

    @IBOutlet weak var makerLogo: UIImageView!
    @IBOutlet weak var makerName: UILabel!
    var addMakerToFavorite : (() -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell (maker: UserPageDataModel){
        self.makerLogo.findMe(url: maker.PhotoUrl, raduis: true)
        self.makerName.text = maker.Name
    }
    
    func configCell (speaker: SpeakersDataModel){
        self.makerLogo.findMe(url: speaker.PhotoUrl, raduis: true)
        self.makerName.text = speaker.Name
    }
    
    
    @IBAction func starButton(_ sender: UIButton) {
        addMakerToFavorite?()
    }
    
}
