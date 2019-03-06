//
//  PopupHandler.swift
//  2OnMarch
//
//  Created by rocky on 2/6/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class PopupHandler {
    
    static let mainSB = UIStoryboard(name: "Popup", bundle: nil)
    
    static var forget: UIViewController {
        get {
            return mainSB.instantiateInitialViewController()!
        }
    }
    
}


