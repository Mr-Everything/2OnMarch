//
//  loginViewController.swift
//  2OnMarch
//
//  Created by rocky on 2/6/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    
    @IBAction func login(_ sender: UIButton) {
        guard let email = emailTF.text, Validate.email(email) == true else { return }
        guard let password = passwordTF.text, Validate.password(password) == true else { return }
        
        let user = UserDataModel()
        user.Email = email
        user.Password = password
        UserFunctionModel.controller = self 
        UserFunctionModel.getUser(user: user) { (user) in
            if user != nil {
                DataModel.user = user!
                StoryBoard.openSB("Notification")
            }
        }
    }
    
    @IBAction func loginWithFacebook(_ sender: UIButton) {
        
    }
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        present(PopupHandler.forget, animated: true)
    }
    
    @IBAction func letsMakeIt(_ sender: UIButton) {
        self.moveTo(with: "firstRegisterViewController")
    }
    

}
