//
//  UserPageGallaryDataModel.swift
//  2OnMarch
//
//  Created by rocky on 2/27/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserPageGallaryDataModel {
    
    public var Id: Int!
    public var Fk_User:String?
    public var Fk_Agenda:String?
    public var Rate:String?
    public var Comment:String?
    
    init() {}
    
    init(object: JSON) {
        if let rate = object.dictionary {
            
            self.Id = rate["Id"]?.int
            self.Fk_User = rate["Fk_User"]?.string
            self.Fk_Agenda = rate["Fk_Agenda"]?.string
            self.Rate = rate["Rate"]?.string
            self.Comment = rate["Comment"]?.string
            
        } // end of dictionary check
    }// end of init
}
