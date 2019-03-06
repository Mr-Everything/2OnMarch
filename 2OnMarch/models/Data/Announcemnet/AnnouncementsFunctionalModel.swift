//
//  AnnouncementsFunctionalModel.swift
//  2OnMarch
//
//  Created by rocky on 2/27/19.
//  Copyright © 2019 dinnova. All rights reserved.
//


import UIKit
import SwiftyJSON

class AnnouncementsFunctionalModel {
    
    static var controller: UIViewController = homeAppViewController()
    static let mainURL: String = mainModel.mainURL + "App/"
    
    class func getData(completion: @escaping (_ professions: [AnnouncementsDataModel]) -> ()) {
        
        let url = AnnouncementsFunctionalModel.mainURL + "GetAnnouncements"
        Request.send(self.controller, url: url, way: .get, params: nil) { (response, hasData) in
            if hasData == true {
                if let result = response?["Data"].array {
                    var data = [AnnouncementsDataModel]()
                    result.forEach({ (element) in
                        let obj = AnnouncementsDataModel(object: element)
                        print(element)
                        data.append(obj)
                    })
                    completion(data)
                }
            }
        }
        
    }
    
    
}
