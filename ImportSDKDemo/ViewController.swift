//
//  ViewController.swift
//  ImportSDKDemo
//
//  Created by DJI on 8/1/17.
//  Copyright © 2017 DJI. All rights reserved.
//

import UIKit
import DJISDK

class ViewController: UIViewController, DJISDKManagerDelegate {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        DJISDKManager.registerApp(with: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlertViewWithTitle(title: String, withMessage message: String) {
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction.init(title:"OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // DJISDKManagerDelegate Methods
    func productConnected(_ product: DJIBaseProduct?) {
        
        NSLog("Product Connected")
    }
    
    func productDisconnected() {
        
        NSLog("Product Disconnected")
    }
    
    func appRegisteredWithError(_ error: Error?) {
        
        var message = "Register App Successed!"
        if (error != nil) {
            message = "Register app failed! Please enter your app key and check the network."
        }else{
            NSLog("Register App Successed!");
        }

        self.showAlertViewWithTitle(title:"Register App", withMessage: message)
    }


}

