//
//  OpenUp.swift
//  2OnMarch
//
//  Created by rocky on 2/19/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class StoryBoard: UIViewController {
    
    static func openSB(_ name: String) {
        let sb = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()
        let rootController = UIApplication.shared.keyWindow!
        rootController.rootViewController = sb
    }
    
    static func returnViewController(sb: String, identifier: String?) -> UIViewController {
        
        var vc: UIViewController!
        let sb = UIStoryboard(name: sb, bundle: nil)
        if identifier != nil {
            vc = sb.instantiateViewController(withIdentifier: identifier!)
        }else {
            vc = sb.instantiateInitialViewController()
        }
        return vc
    }
    
}
