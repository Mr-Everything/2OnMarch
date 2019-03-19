//
//  textFieldView.swift
//  2OnMarch
//
//  Created by Kamal on 3/18/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
@IBDesignable class viewsTF: UIView {
    
    @IBInspectable var radius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var border: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = border
        }
    }
    
    @IBInspectable var colorBorder: UIColor = UIColor.red {
        didSet {
            self.layer.borderColor = colorBorder.cgColor
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
