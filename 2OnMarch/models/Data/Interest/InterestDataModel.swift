//
//  InterestDataModel.swift
//  2OnMarch
//
//  Created by rocky on 2/19/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import Foundation
import SwiftyJSON

class InterestDataModel  {
    
    public var Id: Int!
    public var Name:String?
    
    init() {}
    
    init(object: JSON) {
        if let interest = object.dictionary {
            self.Id = interest["Id"]?.int
            self.Name = interest["Name"]?.string
        } // end of dictionary check
    }// end of init
    
}
