//
//  scanSegmentedViewController.swift
//  2OnMarch
//
//  Created by rocky on 3/9/19.
//  Copyright © 2019 dinnova. All rights reserved.
//

import UIKit
import AVFoundation
import QRCodeReader
import XLPagerTabStrip

class scanSegmentedViewController: UIViewController, IndicatorInfoProvider, QRCodeReaderViewControllerDelegate  {
    
    var status: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        if status == true {
            self.status = false
            readerVC.delegate = self
            readerVC.completionBlock = { (result: QRCodeReaderResult?) in
                print(result as Any)
            }
            readerVC.modalPresentationStyle = .formSheet
            present(readerVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.status = true
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "SCAN")
    }
    

    // Good practice: create the reader lazily to avoid cpu overload during the
    // initialization and each time we need to scan a QRCode
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    // MARK: - QRCodeReaderViewController Delegate Methods
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        print(result.value)
        print(result)
        dismiss(animated: true, completion: nil)
    }
    
    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
    //By pressing on the switch camera button
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        let cameraName = newCaptureDevice.device.localizedName
        print("Switching capture to: \(cameraName)")
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        self.status = true 
        dismiss(animated: true, completion: nil)
    }
    
}

