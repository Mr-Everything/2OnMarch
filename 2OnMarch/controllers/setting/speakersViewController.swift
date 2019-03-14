//
//  speakersViewController.swift
//  2OnMarch
//
//  Created by rocky on 3/9/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
fileprivate let nib_identifier = "makerTableViewCell"
class speakersViewController: UIViewController {
    
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
        SpeakersFunctionalModel.getData(params: params) { (speakers) in
            self.speakers = speakers
            self.classTableView.reloadData()
        }
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }

}

extension speakersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
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
