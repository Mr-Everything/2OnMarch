//
//  UIViewControllerextension.swift
//  2OnMarch
//
//  Created by rocky on 2/6/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    func loading(_ start: Bool) {
        if start == false {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }else {
            let activityData = ActivityData(size: nil, message: nil, messageFont: nil, messageSpacing: nil, type: NVActivityIndicatorType.ballGridBeat, color: nil, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: nil, textColor: nil)
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        }
    }
    
    
    func addGestureToPopup(mainview: UIView, nestedView: UIView) {
        let hide = UITapGestureRecognizer(target: self, action: #selector(viewTappedToDismiss(_:)))
        let show = UITapGestureRecognizer(target: self, action: #selector(viewTappedNotToDismiss(_:)))
        mainview.addGestureRecognizer(hide)
        nestedView.addGestureRecognizer(show)
    }
    
    @objc func viewTappedToDismiss(_ touch: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func viewTappedNotToDismiss(_ touch: UITapGestureRecognizer) {
        return 
    }
    
    func moveTo(with identifier: String) {
        self.performSegue(withIdentifier: identifier, sender: self)
    }
    
    
    // OPEN GALLERY
    
    func openCamera(imagePicker: UIImagePickerController)
    {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary(imagePicker: UIImagePickerController)
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        
        self.present(imagePicker, animated: true, completion: nil)
    }

    
    func addCustomObserver(name: Notification.Name, completion: @escaping (_ name: Notification)->()) -> NSObjectProtocol {
        let observer = NotificationCenter.default.addObserver(forName: name, object: nil, queue: OperationQueue.main) { (notification) in
            completion(notification)
        }
        return observer
    }
    
    
}
