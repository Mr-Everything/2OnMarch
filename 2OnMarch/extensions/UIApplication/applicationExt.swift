//
//  applicationExt.swift
//  2OnMarch
//
//  Created by rocky on 3/9/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
