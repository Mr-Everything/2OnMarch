//
//  FavoritesViewController.swift
//  2OnMarch
//
//  Created by Kamal on 3/11/19.
//  Copyright © 2019 dinnova. All rights reserved.


import UIKit
import XLPagerTabStrip

class FavoritesViewController: ButtonBarPagerTabStripViewController, IndicatorInfoProvider {

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
     
     func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
     return IndicatorInfo(title: "SPEAKERS")
     }
     
     override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
     
        let Speakers = StoryBoard.returnViewController(sb: "segmented", identifier: "favoritesSpeakersTableViewCell")
        let Activity = StoryBoard.returnViewController(sb: "segmented", identifier: "favoritesActivityTableViewCell")
        let Agenda = StoryBoard.returnViewController(sb: "segmented", identifier: "favoritesAgendaTableViewCell")
        let Makers = StoryBoard.returnViewController(sb: "segmented", identifier: "favoritesMakersTableViewCell")
     
     return [Speakers, Activity, Agenda, Makers]
     }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
