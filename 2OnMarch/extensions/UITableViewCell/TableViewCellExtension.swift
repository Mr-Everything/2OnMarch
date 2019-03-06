//
//  TableViewCellExtension.swift
//  2OnMarch
//
//  Created by rocky on 2/18/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func raduis(setRaduis: CGFloat) {
        self.layer.cornerRadius = setRaduis
        self.layer.masksToBounds = true
    }
    
    func smoothShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 0.8
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0.4, height: 2.0)
        layer.masksToBounds = false 
    }
}
