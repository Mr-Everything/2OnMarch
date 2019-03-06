//
//  IBDesignableBarItem.swift
//  2OnMarch
//
//  Created by rocky on 2/23/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

@IBDesignable
class IBDesignableBarItem: UITabBarItem {

    @IBInspectable var width: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet {
            
        }
    }
    
}

