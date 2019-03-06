//
//  buttonextension.swift
//  2OnMarch
//
//  Created by rocky on 2/7/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import SDWebImage

extension UIButton {
    
    func findImage(_ url: String?) {
        if url != nil || url?.isEmpty == false || url?.hasPrefix("http") == true {
            DispatchQueue.main.async {
                let imagePath = url
                self.sd_setShowActivityIndicatorView(true)
                self.sd_setIndicatorStyle(.gray)
                self.sd_setImage(with: URL(string: imagePath!), for: .normal, placeholderImage: UIImage(named: "profile-pic-size"), options: SDWebImageOptions(), completed: nil)
            }
        }else {
            self.setImage(UIImage(named: "logo_app"), for: .normal)
        }
    }
    
}
