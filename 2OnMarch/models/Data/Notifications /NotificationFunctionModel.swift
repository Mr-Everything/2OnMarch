//
//  NotificationFunctionModel.swift
//  2OnMarch
//
//  Created by rocky on 2/19/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import SwiftyJSON

class NotificationFunctionModel {
   
    static var controller: UIViewController = homeAppViewController()
    static let mainURL: String = mainModel.mainURL + "App/"
    
    class func getData(completion: @escaping (_ professions: [NotificationDataModel]) -> ()) {
        
        let url = NotificationFunctionModel.mainURL + "GetHomeNotifications"
        Request.send(self.controller, url: url, way: .get, params: nil) { (response, hasData) in
            if hasData == true {
                if let result = response?["Data"].array {
                    var data = [NotificationDataModel]()
                    result.forEach({ (element) in
                        let obj = NotificationDataModel(object: element)
                        print(element)
                        data.append(obj)
                    })
                    completion(data)
                }
            }
        }
        
    }
    

}


