//
//  AgendaRateDataModel.swift
//  2OnMarch
//
//  Created by rocky on 2/27/19.
//  Copyright © 2019 dinnova. All rights reserved.
//


import Foundation
import SwiftyJSON

class AgendaRateDataModel {
    
    public var Id: Int!
    public var Fk_User:Int?
    public var Fk_Agenda:Int?
    public var Rate:Int?
    public var Comment:String?
    
    init() {}
    
    init(object: JSON) {
        if let rate = object.dictionary {
            
            self.Id = rate["Id"]?.int
            self.Fk_User = rate["Fk_User"]?.int
            self.Fk_Agenda = rate["Fk_Agenda"]?.int
            self.Rate = rate["Rate"]?.int
            self.Comment = rate["Comment"]?.string
            
        } // end of dictionary check
    }// end of init
}
