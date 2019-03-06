//
//  professionsCollectionViewCell.swift
//  2OnMarch
//
//  Created by rocky on 2/7/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class professionsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btn.sizeToFit()
    }
    
    @IBAction func clicked(_ sender: UIButton) {
        changeAppearance()
    }
    
    public func config(with name: String, Id tag: Int) {
        self.btn.tag = tag
        self.btn.setTitle(name, for: .normal)
    }
    
    public func changeAppearance() {
        if btn.backgroundColor == UIColor.clear {
            self.btn.backgroundColor = .red
        }else {
            self.btn.backgroundColor = UIColor.clear
        }
    }

}
