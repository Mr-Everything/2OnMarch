//
//  FavoritesMakersViewController.swift
//  2OnMarch
//
//  Created by Kamal on 3/11/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import XLPagerTabStrip
fileprivate let nib_identifier = "makerTableViewCell"

class FavoritesMakersViewController: UIViewController ,IndicatorInfoProvider {

    @IBOutlet weak var searchMakersTF: UITextField!
    @IBOutlet weak var classTableView: UITableView!
    var makers = [UserPageDataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        classTableView.register(with: nib_identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UserPageFunctionalModel.controller = self
        let params = ["Fk_User": DataModel.user.Id!] as [String: Any]
        let url = mainModel.mainURL + "User/GetFavouriteUserPages"
        UserPageFunctionalModel.getData(url,params: params) { (makers) in
            self.makers = makers
            self.classTableView.reloadData()
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MAKERS")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

extension FavoritesMakersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.makers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: nib_identifier, for: indexPath) as! makerTableViewCell
        let maker = self.makers[indexPath.row]
        cell.configCell(maker: maker)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

