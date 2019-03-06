//
//  IBDesignableStackView.swift
//  2OnMarch
//
//  Created by rocky on 2/6/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

@IBDesignable class IBDesignableStackView: UIStackView {
    
    @IBInspectable var border: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = border
            self.layer.borderColor = Theme.defaultColor.cgColor
        }
    }
}
