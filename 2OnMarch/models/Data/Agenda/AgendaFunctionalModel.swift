//
//  AgendaFunctionalModel.swift
//  2OnMarch
//
//  Created by rocky on 2/27/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import SwiftyJSON

class AgendaFunctionalModel {
    
    static var controller: UIViewController = homeAppViewController()
    static let mainURL: String = mainModel.mainURL + "App/"
    
    class func getData(params: [String: Any], completion: @escaping (_ professions: [AgendaDataModel]) -> ()) {
        let url = AgendaFunctionalModel.mainURL + "GetAllAgenda"
        
        Request.send(self.controller, url: url, way: .get, params: params) { (response, hasData) in
            if hasData == true {
                if let result = response?["Data"].array {
                    var data = [AgendaDataModel]()
                    result.forEach({ (element) in
                        if let element = element["AgendaModels"].array {
                            element.forEach({ (item) in
                                let obj = AgendaDataModel(object: item)
                                data.append(obj)
                            })
                        }
                    })
                    completion(data)
                }
            }
        }
        
    }
    
}
