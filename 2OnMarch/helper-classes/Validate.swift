//
//  Validate.swift
//  2OnMarch
//
//  Created by rocky on 2/6/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class Validate : UIViewController {
    
    static func email(_ email: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailTest.evaluate(with: email) == true {
            return true
        }
        
        Messenger.alert(UIViewController(), "INVALID", message: "Invalid Email", style: .alert)
        
        return false
        
    }
    
    static func password(_ pass: String) -> Bool {
        if pass.count >= 6 && pass.count <= 16 {
            return true
        }
        
        Messenger.alert(UIViewController(), "INVALID", message: "Invalid Password", style: .alert)
        
        return false
    }
    
    static func phone(_ phone: String) -> Bool {
        
        if phone.count == 11 {
            let p = phone.prefix(3)
            if p == "010" || p == "011" || p == "012" || p == "015" {
                return true
            }
        }
        
        Messenger.alert(UIViewController(), "INVALID", message: "Invalid Phone", style: .alert)
        
        return false
        
    }
    
}
