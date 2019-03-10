//
//  UserModel.swift
//  2OnMarch
//
//  Created by rocky on 2/6/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserDataModel  {
    
    public var Id: Int? = nil
    public var Name:String?
    public var Email:String?
    public var Password:String?
    public var ProviderId:String?
    public var Gender:String?
    public var Age:Int?
    public var Title:String?
    public var Company:String?
    public var Phone:String?
    public var PhotoUrl:String?
    public var Bio:String?
    public var Fk_UserType:Int?
    public var QR:String?
    public var UniqId:String?
    public var IsFavourite:Bool?
    public var Facebook:String?
    public var Instagram:String?
    public var Twitter:String?
    public var LinkedIn:String?
    public var Behance:String?
    public var Image:String?
    public var ImageUploaded:UIImage?
    public var UserInterestModel = [InterestDataModel]()
    public var UserPageModel = [UserPageDataModel]()
    
    init() {
        
    }
    
    init(object: JSON) {
        if let user = object["Data"].dictionary {
            // int
            self.Id = user["Id"]?.int
            self.Age = user["Age"]?.int
            self.Fk_UserType = user["Fk_UserType"]?.int
            // strings
            self.Name = user["Name"]?.string
            self.Email = user["Email"]?.string
            self.Gender = user["Gender"]?.string
            self.Company = user["Company"]?.string
            self.Phone = user["Phone"]?.string
            self.PhotoUrl = user["PhotoUrl"]?.string
            self.Bio = user["Bio"]?.string
            self.QR = user["QR"]?.string
            self.UniqId = user["UniqId"]?.string
            self.Facebook = user["Facebook"]?.string
            self.Instagram = user["Instagram"]?.string
            self.Twitter = user["Twitter"]?.string
            self.LinkedIn = user["LinkedIn"]?.string
            self.Behance = user["Behance"]?.string
            // bool
            self.IsFavourite = user["IsFavourite"]?.bool
            self.Image = user["Image"]?.string
            if let interests = user["interests"]?.array {
                interests.forEach { (item) in
                    let interest = InterestDataModel(object: item)
                    self.UserInterestModel.append(interest)
                }
            }
        } // end of dictionary check
    }// end of init
    
}
