//
//  IBDesignableButton.swift
//  2OnMarch
//
//  Created by rocky on 2/6/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

@IBDesignable class IBDesignableButton: UIButton {
    
    @IBInspectable var border: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = border
            self.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @IBInspectable var radius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true 
        }
    }
    
    @IBInspectable var shadowSize: CGFloat = 0.0 {
        didSet {
            self.layer.shadowOffset = CGSize(width: 0.0, height: shadowSize)
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 2.0
            self.layer.masksToBounds = false
        }
    }
    
}

