//
//  firstRegisterViewController.swift
//  2OnMarch
//
//  Created by rocky on 2/7/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit

class firstRegisterViewController: UIViewController,
UINavigationControllerDelegate {

    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var companyTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var bioTF: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    var imagePicker = UIImagePickerController() // UIimage picker set it's delegate to self
    let userModel = UserDataModel() // will be send to the next registerViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    @IBAction func next(_ sender: UIButton) {
        
        guard let name = fullNameTF.text, name.isEmpty == false else {
            print("I came here ")
            return
        }
        guard let title = titleTF.text, title.isEmpty == false else { return }
        guard let company = companyTF.text, company.isEmpty == false else { return }
        guard let email = emailTF.text, email.isEmpty == false else { return }
        guard let phone = phoneTF.text, phone.isEmpty == false else { return }
        guard let password = passwordTF.text, password.isEmpty == false else { return }
        
        userModel.Name = name
        userModel.Title = title
        userModel.Company = company
        userModel.Email = email
        userModel.Phone = phone
        userModel.Password = password
        userModel.ImageUploaded = profileImage.image
        
        self.moveTo(with: "secondRegisterViewController")
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.present(UIStoryboard(name: "Auth", bundle: nil).instantiateInitialViewController()!, animated: true)
        }
    }
    
    @IBAction func uploadImage(_ sender: UIButton) {
        Messenger.alertWithActions(self, nil, message: "Choose Image", style: .actionSheet, actions: ["Gallery": .default, "Camera": .default, "Cancel": .cancel]) { (name) in
            if name == "Gallery" {
                self.openGallary(imagePicker: self.imagePicker)
            } else if name == "Camera" {
                self.openCamera(imagePicker: self.imagePicker)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondRegisterViewController" {
            if let dest = segue.destination as? secondRegisterViewController {
                dest.userModel = self.userModel
                dest.profileImage = self.profileImage.image
            }
        }
    }
    
}

extension firstRegisterViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            dismiss(animated: true) {
                self.profileImage.image = image
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
