//
//  mainFeedsViewController.swift
//  2OnMarch
//
//  Created by rocky on 2/19/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

fileprivate let nib_identifer = "feedsTableViewCell"

class mainFeedsViewController: UIViewController {

    @IBOutlet weak var classTableView: UITableView!
    //var result = []()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classTableView.register(with: [Constants.sperator_cell, ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
}
/*
extension mainFeedsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
*/
