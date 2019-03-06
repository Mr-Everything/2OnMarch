//
//  MakerTableViewController.swift
//  2OnMarch
//
//  Created by Kamal on 3/5/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import XLPagerTabStrip
fileprivate let nib_identifier = "makerTableViewCell"


class MakerTableViewController: UIViewController, IndicatorInfoProvider {

    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var classTableView: UITableView!
    
    var data = [UserPageDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classTableView.register(with: [Constants.sperator_cell, nib_identifier])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let params = ["Fk_User": DataModel.user.Id!] as [String: Any]
        UserPageFunctionalModel.controller = self
        UserPageFunctionalModel.getData(params: params) { (makers) in
            self.data = makers
            self.classTableView.reloadData()
        }
        
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MAKER")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    

}

extension MakerTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ( data.count * 2 )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: nib_identifier, for: indexPath) as! makerTableViewCell
            
            cell.addMakerToFavorite = {
                print("add to favorite")
            }
            
            return cell
        }else {
            return tableView.dequeueReusableCell(withIdentifier: Constants.sperator_cell, for: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ( indexPath.row % 2 == 0 ) ? 80 : 5
    }
}
