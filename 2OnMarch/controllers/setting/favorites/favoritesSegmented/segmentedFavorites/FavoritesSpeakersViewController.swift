//
//  FavoritesSpeakersViewController.swift
//  2OnMarch
//
//  Created by Kamal on 3/11/19.
//  Copyright © 2019 dinnova. All rights reserved.
// SPEAKERS

import UIKit
import XLPagerTabStrip
fileprivate let nib_identifier = "makerTableViewCell"

class FavoritesSpeakersViewController: UIViewController , IndicatorInfoProvider {

    @IBOutlet weak var searchSpeakersTF: UITextField!
    @IBOutlet weak var classTableView: UITableView!
    var speakers = [SpeakersDataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        classTableView.register(with: nib_identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SpeakersFunctionalModel.controller = self
        let params = ["Fk_User": DataModel.user.Id!] as [String: Any]
        let url = mainModel.mainURL + "User/GetFavouriteSpeakers"
        SpeakersFunctionalModel.getData(url, params: params) { (speakers) in
            self.speakers = speakers
            self.classTableView.reloadData()
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "SPEAKERS")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

extension FavoritesSpeakersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.speakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: nib_identifier, for: indexPath) as! makerTableViewCell
        let speaker = self.speakers[indexPath.row]
        cell.configCell(speaker: speaker)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
}
