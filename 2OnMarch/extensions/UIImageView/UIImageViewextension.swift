//
//  UIImageViewextension.swift
//  2OnMarch
//
//  Created by rocky on 2/19/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit


extension UIImageView {
    
    func findMe(url: String?, raduis: Bool) {
        guard url != nil else { self.image = UIImage(named: "logo_app") ; return }
        DispatchQueue.main.async {
            let imagePath = url
            self.sd_setShowActivityIndicatorView(true)
            self.sd_setIndicatorStyle(.gray)
            self.sd_setImage(with: URL(string: imagePath!), placeholderImage: UIImage(named: "logo_app"))
            if raduis == true {
                self.imageRadius()
            }
        }
    }
    
    func imageRadius() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    
}
