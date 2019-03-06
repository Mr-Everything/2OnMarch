//
//  announcementSegmentedViewController.swift
//  2OnMarch
//
//  Created by rocky on 2/23/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import XLPagerTabStrip

fileprivate let nib_identifer = "feedsTableViewCell"
class announcementSegmentedViewController: UIViewController, IndicatorInfoProvider {
   
    @IBOutlet weak var classTableView: UITableView!
    var request = [AnnouncementsDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classTableView.register(with: [Constants.sperator_cell, nib_identifer])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        AnnouncementsFunctionalModel.getData { (result) in
            self.request = result
            self.classTableView.reloadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "ANNOUNCEMENTS")
    }
}

extension announcementSegmentedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ( request.count * 2 )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: nib_identifer, for: indexPath) as! feedsTableViewCell
            
            let num = indexPath.row / 2
            
            cell.configCellForAnnounceMent(model: self.request[num])
            
            return cell
        }else {
            return tableView.dequeueReusableCell(withIdentifier: Constants.sperator_cell, for: indexPath)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row % 2 != 0 {
            return 10
        }else {
            return UITableView.automaticDimension
        }
    }
}

