//
//  SpeakersDataModel.swift
//  2OnMarch
//
//  Created by rocky on 2/27/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import Foundation
import SwiftyJSON

class SpeakersDataModel {
    
    public var Id: Int!
    public var Name:String?
    public var Email:String?
    public var Gender:String?
    public var Age:Int?
    public var Fk_UserType:Int?
    
    public var Title:String?
    public var Company:String?
    public var Phone:String?
    public var PhotoUrl:String?
    
    public var Bio:String?
    public var Password:String?
    public var QR:String?
    
    public var UniqId:String?
    public var IsFavourite:Bool?
    public var Facebook:String?
    public var Instagram:String?
    
    public var Twitter:String?
    public var LinkedIn:String?
    public var Behance:String?
    public var ProviderId:String?
    public var HaveUserPage:Bool?
    public var HaveActivity:Bool?
    public var UserPageModel:UserPageDataModel?
    
    init() {}
    
    init(object: JSON) {
        if let rate = object.dictionary {
            
            self.Id = rate["Id"]?.int
            self.Name = rate["Name"]?.string
            self.Email = rate["Email"]?.string
            self.Gender = rate["Gender"]?.string
            self.Age = rate["Age"]?.int
            
            self.Title = rate["Title"]?.string
            self.Company = rate["Company"]?.string
            self.Phone = rate["Phone"]?.string
            self.PhotoUrl = rate["PhotoUrl"]?.string
            self.Bio = rate["Bio"]?.string
            self.Password = rate["Password"]?.string
            self.Fk_UserType = rate["Fk_UserType"]?.int
            self.UniqId = rate["UniqId"]?.string
            self.IsFavourite = rate["IsFavourite"]?.bool
            self.Facebook = rate["Facebook"]?.string
            self.Instagram = rate["Instagram"]?.string
            self.Twitter = rate["Twitter"]?.string
            self.LinkedIn = rate["LinkedIn"]?.string
            self.Behance = rate["Behance"]?.string
            self.ProviderId = rate["ProviderId"]?.string
            self.HaveUserPage = rate["HaveUserPage"]?.bool
            self.HaveActivity = rate["Id"]?.bool

            
            if let UserPageModel = rate["UserPageModel"]?.dictionary {
                self.UserPageModel?.Id = UserPageModel["Id"]?.int
                self.UserPageModel?.Fk_User = UserPageModel["Fk_User"]?.int
                self.UserPageModel?.PhotoUrl = UserPageModel["PhotoUrl"]?.string
                self.UserPageModel?.Name = UserPageModel["Name"]?.string
                self.UserPageModel?.Bio = UserPageModel["Bio"]?.string
                self.UserPageModel?.Phone = UserPageModel["Phone"]?.string
                self.UserPageModel?.Facebook = UserPageModel["Facebook"]?.string
                self.UserPageModel?.Instagram = UserPageModel["Instagram"]?.string
                
                self.UserPageModel?.Twitter = UserPageModel["Twitter"]?.string
                self.UserPageModel?.LinkedIn = UserPageModel["LinkedIn"]?.string
                self.UserPageModel?.Behance = UserPageModel["Behance"]?.string
                
                self.UserPageModel?.Location = UserPageModel["Location"]?.string
                self.UserPageModel?.IsFavorite = UserPageModel["Id"]?.bool
                
                if let UserPageGallaryModels = UserPageModel["UserPageGallaryModels"]?.array {
                    UserPageGallaryModels.forEach { (element) in
                        self.UserPageModel?.UserPageGallaryModels.append(UserPageGallaryDataModel(object: element))
                    }
                }
                
            }
            
        } // end of dictionary check
    }// end of init
}
