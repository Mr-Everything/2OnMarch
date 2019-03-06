//
//  forgetPasswordViewController.swift
//  2OnMarch
//
//  Created by rocky on 2/6/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class forgetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nestedView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        addGestureToPopup(mainview: mainView, nestedView: nestedView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    @IBAction func send(_ sender: UIButton) {
        guard let email = emailTF.text, Validate.email(email) == true else { return }
        
    }

}
