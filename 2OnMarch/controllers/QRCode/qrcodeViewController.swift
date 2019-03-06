//
//  qrcodeViewController.swift
//  2OnMarch
//
//  Created by rocky on 2/24/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import QRCode

class qrcodeViewController: UIViewController {

    @IBOutlet weak var qrcodeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // URL
        let url = URL(string: "http://schuch.me")!
        let qrCode = QRCode(url)
        self.qrcodeImage.image = qrCode?.image
    }

}
