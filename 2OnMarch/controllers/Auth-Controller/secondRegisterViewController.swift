//
//  secondRegisterViewController.swift
//  2OnMarch
//
//  Created by rocky on 2/7/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import SwiftyJSON
import UIKit

fileprivate let nib_identifier = "interestsTableViewCell"
class secondRegisterViewController: UIViewController {

    @IBOutlet weak var classTableview: UITableView!
    
    var userModel: UserDataModel!
    var profileImage: UIImage? = nil
    var data = [InterestDataModel]()
    var selectedInterestes: [Int: InterestDataModel] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classTableview.register(with: Constants.sperator_cell)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        InterestFunctionModel.controller = self
        InterestFunctionModel.getData { (data) in
            self.data = data
            self.classTableview.reloadData()
        }
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        //userModel.
        self.selectedInterestes.values.forEach({ (interest) in
            self.userModel.UserInterestModel.append(interest)
        })
        UserFunctionModel.createUser(user: userModel)
    }
    
}

extension secondRegisterViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ( data.count * 2 )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: nib_identifier, for: indexPath)
            
            let num = indexPath.row / 2
            let interestModel = data[num]
            
            cell.textLabel?.text = interestModel.Name
            cell.tag = interestModel.Id
            
            if selectedInterestes[num] != nil {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            cell.raduis(setRaduis: 8)
            
            return cell
        }else {
            return tableView.dequeueReusableCell(withIdentifier: Constants.sperator_cell, for: indexPath)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            let num = indexPath.row / 2
            if let cell = tableView.cellForRow(at: indexPath) {
                if cell.accessoryType == .checkmark {
                    self.selectedInterestes.removeValue(forKey: num)
                    cell.accessoryType = .none
                }else {
                    self.selectedInterestes[num] = self.data[num]
                    cell.accessoryType = .checkmark
                }
                return
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 35
        }else {
            return 5
        }
    }
}
