//
//  IBDesignableView.swift
//  2OnMarch
//
//  Created by rocky on 2/19/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
@IBDesignable class IBDesignableView: UIView {
    
    @IBInspectable var radius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var shadowSize: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet {
            self.layer.shadowOffset = shadowSize
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 2.0
            self.layer.masksToBounds = false
        }
    }
    
}
