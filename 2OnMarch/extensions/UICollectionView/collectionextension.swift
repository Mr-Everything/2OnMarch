//
//  collectionextension.swift
//  2OnMarch
//
//  Created by rocky on 2/7/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(with identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}
