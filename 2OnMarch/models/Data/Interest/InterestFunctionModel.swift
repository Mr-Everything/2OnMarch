//
//  InterestFunctionModel.swift
//  2OnMarch
//
//  Created by rocky on 2/19/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class InterestFunctionModel {
    
    static var controller: UIViewController = loginViewController()
    static let mainURL: String = mainModel.mainURL + "User/"

    class func getData(completion: @escaping (_ professions: [InterestDataModel]) -> ()) {
        let url = InterestFunctionModel.mainURL + "Create"
        print(url)
        Request.send(self.controller, url: url, way: .get, params: nil) { (response, hasData) in
            if hasData == true {
                if let result = response?["Data"].array {
                    var data = [InterestDataModel]()
                    result.forEach({ (element) in
                        let obj = InterestDataModel(object: element)
                        data.append(obj)
                    })
                    completion(data)
                }
            }
        }
    }

}
