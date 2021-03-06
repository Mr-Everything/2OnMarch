//
//  qrcodeViewController.swift
//  2OnMarch
//
//  Created by rocky on 2/24/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import XLPagerTabStrip
// import QRCode
class qrcodeViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemBackgroundColor = Theme.NavigationColor
        settings.style.selectedBarHeight = 2
        settings.style.selectedBarBackgroundColor = .white
        settings.style.buttonBarItemFont = .systemFont(ofSize: 12)
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let notification = StoryBoard.returnViewController(sb: "segmented", identifier: "scanSegmentedViewController")
        let announcment = StoryBoard.returnViewController(sb: "segmented", identifier: "myCodeSegmentedViewController")
        
        return [notification, announcment]
    }

    
}
