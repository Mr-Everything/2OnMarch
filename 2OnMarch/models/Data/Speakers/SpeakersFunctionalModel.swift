//
//  SpeakersFunctionalModel.swift
//  2OnMarch
//
//  Created by rocky on 2/27/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import Foundation
import SwiftyJSON

class SpeakersFunctionalModel {
    
    static var controller: UIViewController = homeAppViewController()
    static let mainURL: String = mainModel.mainURL + "App/"
    
    class func getData(params : [String: Any], completion: @escaping (_ professions: [SpeakersDataModel]) -> ()) {
        
        let url = SpeakersFunctionalModel.mainURL + "GetSpeakers"
        Request.send(self.controller, url: url, way: .get, params: params) { (response, hasData) in
            if hasData == true {
                if let result = response?["Data"].array {
                    var data = [SpeakersDataModel]()
                    result.forEach({ (element) in
                        let obj = SpeakersDataModel(object: element)
                        data.append(obj)
                    })
                    completion(data)
                }
            }
        }
        
    }
    
}



