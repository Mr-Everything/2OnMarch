//
//  makerFunctionalModel.swift
//  2OnMarch
//
//  Created by Kamal on 3/5/19.
//  Copyright © 2019 dinnova. All rights reserved.
//


import UIKit
import SwiftyJSON

class UserPageFunctionalModel {
    
    static var controller: UIViewController = homeAppViewController()
    static let mainURL: String = mainModel.mainURL + "App/"
    
    class func getData(_ link: String = "" ,params : [String: Any], completion: @escaping (_ professions: [UserPageDataModel]) -> ()) {
        var url: String!
        if link.isEmpty == false {
            url = link
        } else {
            url = UserPageFunctionalModel.mainURL + "GetAllUserPages"
        }
        Request.send(self.controller, url: url, way: .get, params: params) { (response, hasData) in
            if hasData == true {
                if let result = response?["Data"].array {
                    var data = [UserPageDataModel]()
                    result.forEach({ (element) in
                        let obj = UserPageDataModel(object: element)
                        data.append(obj)
                    })
                    completion(data)
                }
            }
        }
        
    }
    
}
