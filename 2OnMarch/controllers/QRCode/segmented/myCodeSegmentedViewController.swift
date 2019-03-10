//
//  myCodeSegmentedViewController.swift
//  2OnMarch
//
//  Created by rocky on 3/9/19.
//  Copyright © 2019 dinnova. All rights reserved.
//


import UIKit
import XLPagerTabStrip
import QRCode

class myCodeSegmentedViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var qrcodeLabel: UILabel!
    @IBOutlet weak var qrcodeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // URL
        if DataModel.user.QR != nil {
            let url = URL(string: DataModel.user.QR!)!
            let qrCode = QRCode(url)
            self.qrcodeImage.image = qrCode?.image
            self.qrcodeLabel.text = "Your Code: \(DataModel.user.UniqId!)"
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MY CODE")
    }

}
