//
//  calenderViewController.swift
//  2OnMarch
//
//  Created by rocky on 2/23/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

fileprivate let nib_identifier = "calenderTableViewCell"

class calenderViewController: UIViewController {

    @IBOutlet weak var classTableView: UITableView!
    var agendas = [AgendaDataModel]()
    
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 120, y: 0, width: (UIScreen.main.bounds.size.width + 50), height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        classTableView.register(with: [Constants.sperator_cell, nib_identifier])
        
        searchBar.placeholder = "Search Agenda"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let params = [ "FK_User": DataModel.user.Id!] as [String: Any]
        AgendaFunctionalModel.getData(params: params) { (agendas) in
            self.agendas = agendas
            self.classTableView.reloadData()
        }

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

extension calenderViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ( agendas.count * 2 )
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return UITableView.automaticDimension
        }else {
            return 15
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: nib_identifier, for: indexPath) as! calenderTableViewCell
            let num = indexPath.row / 2
            cell.configCell(model: agendas[num])
            return cell
        }else {
            return tableView.dequeueReusableCell(withIdentifier: Constants.sperator_cell, for: indexPath)
        }
    }
    
}
