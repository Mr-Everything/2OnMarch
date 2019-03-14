//
//  SettingTableViewController.swift
//  2OnMarch
//
//  Created by Kamal on 3/5/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
fileprivate let nib_identifier = "settingTableViewCell"

class SettingViewController: UIViewController {

    @IBOutlet weak var classTableView: UITableView!
    
    let logoArr = ["menu_contact", "menu_speakers", "menu_map" , "menu_fav", "menu_food","menu_sponsors" , "menu_about", "logout"]
    let nameArr = ["Contacts", "Speakers", "Map" , "Favorites", "Food" , "Sponsors", "About" , "Logout"]
    let references  = ["displayContactsViewController", "displaySpeakersViewController","", "displayFavoritesViewControllerSegue"]
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var profession: UILabel!
    @IBOutlet weak var profileImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.name.text = DataModel.user.Name
        self.profession.text = DataModel.user.Title
        self.company.text = DataModel.user.Company
        self.profileImage.findImage(DataModel.user.Image)
    }
}


extension SettingViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: nib_identifier, for: indexPath)
        let num = indexPath.row
        cell.imageView?.image = UIImage(named: self.logoArr[num])
        cell.textLabel?.text = nameArr[num]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == nameArr.count {
            // logout
        }
        performSegue(withIdentifier: self.references[indexPath.row], sender: self)
    }
    
}
