//
//  UserFunctionModel.swift
//  2OnMarch
//
//  Created by rocky on 2/6/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserFunctionModel {
    
    static var controller: UIViewController = loginViewController()
    static let mainURL: String = mainModel.mainURL + "User/"
    
    class func createUser(user: UserDataModel) {
        let url = UserFunctionModel.mainURL + "Create"
        var ids = [Int]()
        user.UserInterestModel.forEach { (id) in
            ids.append(id.Id)
        }
        var params = [
            "Name" : user.Name!,
            "Email" : user.Email!,
            "Phone" : user.Phone!,
            "Company" : user.Company!,
            "Title" : user.Title!,
            "Password": user.Password!,
            "Interests": ids
        ] as [String: Any]
        if let image = user.ImageUploaded {
            params["ImgFile"] = Request.imageToBase64(image: image)
        }
        
        print(params)
        
        Request.send(UIViewController(), url: url, way: .post, params: params) { (response, hasData) in
            if hasData == true {
                //if let response = response {
                    
                //}
            }
        }
    }
    
    class func updateUser(user: UserDataModel) {
        
    }
    
    class func getUser(user: UserDataModel, completion: @escaping (_ user: UserDataModel?) -> ()) {
        let url = UserFunctionModel.mainURL + "Login"
        var params = [String: Any]()
        
        if user.Email != nil {
            params["Email"] = user.Email!
            params["Password"] = user.Password
        }else {
            params["ProviderId"] = user.ProviderId
        }
        
        Request.send(self.controller, url: url, way: .post, params: params) { (response, hasData) in
            if hasData == true {
                if let response = response {
                    if response["Data"]["Id"].int == 0 {
                        let message = response["Status"]["Message"].string!
                        Messenger.alert(self.controller, "NOT EXIST!", message: message, style: .alert)
                        completion(nil)
                    }else {
                        let user = UserDataModel(object: response)
                        DataModel.user = user
                        completion(user)
                    }
                }
            }
        }
    }
    
    class func forgetPassword(_ email: String, completion: @escaping () -> () ) {
        let url = UserFunctionModel.mainURL + "ForgetPassword"
        let params = [ "Email": email ] as [String: Any]
        Request.send(UIViewController(), url: url, way: .post, params: params) { (response, hasData) in
            if hasData == true {
                
            }
        }
    }
    
}

