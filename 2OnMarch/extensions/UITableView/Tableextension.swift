//
//  Tableextension.swift
//  2OnMarch
//
//  Created by rocky on 2/7/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit


extension UITableView {
    func register(with identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        
    }
    
    func register(with identifier: [String]) {
        identifier.forEach { (item) in
            self.register(UINib(nibName: item, bundle: nil), forCellReuseIdentifier: item)
        }
    }
    
}
