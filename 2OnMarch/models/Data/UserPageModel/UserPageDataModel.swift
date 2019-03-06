//
//  UserPageModel.swift
//  2OnMarch
//
//  Created by rocky on 2/26/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserPageDataModel {
    

    public var Id: Int? = nil
    public var Fk_User:Int?
    public var Name:String?
    public var PhotoUrl:String?
    public var Bio:String?
    public var Phone:String?
    public var Facebook:String?
    public var Instagram:String?
    public var Twitter:String?
    public var Behance:String?
    public var LinkedIn:String?
    public var Location:String?
    public var IsFavorite:Bool?
    public var UserPageGallaryModels = [UserPageGallaryDataModel]()
    
    init() {
        
    }
    
    init(object: JSON) {
        if let user = object.dictionary {
            // int
            self.Id = user["Id"]?.int
            // strings
            self.Name = user["Name"]?.string
            self.Phone = user["Phone"]?.string
            self.PhotoUrl = user["PhotoUrl"]?.string
            self.Bio = user["Bio"]?.string
            
            self.Facebook = user["Facebook"]?.string
            self.Instagram = user["Instagram"]?.string
            self.Twitter = user["Twitter"]?.string
            self.LinkedIn = user["LinkedIn"]?.string
            self.Behance = user["Behance"]?.string
            if let UserPageGallaryModels = user["UserPageGallaryModels"]?.array {
                UserPageGallaryModels.forEach { (element) in
                    self.UserPageGallaryModels.append(UserPageGallaryDataModel.init(object: element))
                }
            }
        } // end of dictionary check
    }// end of init
    
    
}

