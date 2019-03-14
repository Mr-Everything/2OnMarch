//
//  FavoritesActivityViewController.swift
//  2OnMarch
//
//  Created by Kamal on 3/11/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import XLPagerTabStrip
fileprivate let nib_identifier = "makerTableViewCell"

class FavoritesActivityViewController: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var searchActivityTF: UITextField!
    @IBOutlet weak var classTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classTableView.register(with: nib_identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        classTableView.register(with: nib_identifier)
        super.viewDidAppear(animated)
        
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "ACTIVITY")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

extension FavoritesActivityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: nib_identifier, for: indexPath) as! makerTableViewCell // ???????????????
        return cell
    }
}


