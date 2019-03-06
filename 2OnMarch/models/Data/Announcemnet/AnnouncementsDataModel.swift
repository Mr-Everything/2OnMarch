//
//  AnnouncementsDataModel.swift
//  2OnMarch
//
//  Created by rocky on 2/27/19.
//  Copyright © 2019 dinnova. All rights reserved.
//


import Foundation
import SwiftyJSON

class AnnouncementsDataModel {
    
    public var Id: Int!
    public var Name:String?
    public var Fk_NotificationType:Int?
    public var Time:String?
    public var PhotoUrl:String?
    public var Date:String?
    public var Description:String?
    
    init() {}
    
    init(object: JSON) {
        if let interest = object.dictionary {
            self.Id = interest["Id"]?.int
            self.Name = interest["Name"]?.string
            self.Time = interest["Time"]?.string
            self.PhotoUrl = interest["PhotoUrl"]?.string
            self.Date = interest["Date"]?.string
            self.Description = interest["Description"]?.string
            self.Fk_NotificationType = interest["Fk_NotificationType"]?.int
            
        } // end of dictionary check
    }// end of init
}
