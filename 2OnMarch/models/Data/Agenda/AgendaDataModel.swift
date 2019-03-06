//
//  AgendaDataModel.swift
//  2OnMarch
//
//  Created by rocky on 2/27/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import Foundation
import SwiftyJSON

class AgendaDataModel {
    
    public var Id: Int!
    public var Name:String?
    public var About:String?
    public var Date:String?
    public var Location:String?
    public var Fk_Speaker:Int?
    public var TimeForm:String?
    public var TimeTo:String?
    public var MartialUrl:String?
    public var IsFavorite:Bool?
    public var AgendaRateModel:AgendaRateDataModel?
    public var Speakers = [SpeakersDataModel]()
    
    init() {}
    
    init(object: JSON) {
        if let interest = object.dictionary {
            
            self.Id = interest["Id"]?.int
            self.Fk_Speaker = interest["Fk_Speaker"]?.int
            self.Name = interest["Name"]?.string
            self.About = interest["About"]?.string
            self.Date = interest["Date"]?.string
            self.TimeForm = interest["TimeForm"]?.string
            self.TimeTo = interest["TimeTo"]?.string
            self.Location = interest["Location"]?.string
            self.MartialUrl = interest["MartialUrl"]?.string
            self.IsFavorite = interest["IsFavorite"]?.bool
            self.AgendaRateModel = AgendaRateDataModel(object: interest["AgendaRateModel"]!)
            
            if let Speakers = interest["Speakers"]?.array {
                Speakers.forEach { (speaker) in
                    let newSpeaker = SpeakersDataModel(object: speaker)
                    self.Speakers.append( newSpeaker )
                }
            }
            
        } // end of dictionary check
    }// end of init
}





