//
//  Request.swift
//  2OnMarch
//
//  Created by rocky on 2/6/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class Request: UIViewController {
    
    static func send(_ object: UIViewController, url: String, way: HTTPMethod, params: [String: Any]?, completion: @escaping (_ data: JSON? , _ hasData: Bool) -> Void ) {
        
        if !NetworkReachabilityManager()!.isReachable {
            Messenger.alert(object, nil, message: "NO Internet Connection", style: .alert)
        } else {
            object.loading(true)
            Alamofire.request(url, method: way, parameters: params, encoding: URLEncoding.default)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseJSON { (response) in
                 switch response.result {
                    case .success(let data) :
                        let json = JSON(data)
                        if json.isEmpty == false {
                            completion(json, true)
                        }else {
                            completion(json, false)
                        }
                        object.loading(false)
                        break
                    case .failure(let error) :
                        print(error as Any)
                        completion(nil, false)
                        object.loading(false)
                        break
                }
            } // END OF ALAMOFIRE REQUEST
        }
    }
    
    static func imageToBase64(image: UIImage) -> String? {
        if let imageData = UIImage.pngData(image) as? NSData {
            let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
            return strBase64
        }
        return nil
    }
    
}
