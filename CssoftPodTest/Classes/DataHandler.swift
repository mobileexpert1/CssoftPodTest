//
//  DataHandler.swift
//  StaffApp
//
//  Created by pankaj_mac_mini on 13/12/16.
//  Copyright © 2016 Pankaj_mac_mini. All rights reserved.
//

import Foundation
import UIKit
public class DataHandler: NSObject {
    open static let shared = DataHandler()
    
    lazy var registerDict = Dictionary<String,Any> ()
    
   public func showAlert(title:String,message:String,completion:( (_ result: Bool) -> Void)?) {
        
        showAlert(title: title, message: message, cancelTitle: "", okTitle: "Ok", completion: completion)
    }
    
    func showAlert(title:String,message:String) {
        
        let window :UIWindow = UIApplication.shared.keyWindow!
        let alert = UIAlertController(title: message, message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        window.rootViewController?.present(alert, animated: true, completion: nil)
        
        // window.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func showLogoutAlert(title:String,message:String,completion:( (_ result: Bool) -> Void)?) {
        
        showAlert(title: title, message: message, cancelTitle: "No", okTitle: "Yes", completion: completion)
    }
    
    func showConfirmAlert(title:String,message:String,completion:( (_ result: Bool) -> Void)?) {
        
        showAlert(title: title, message: message, cancelTitle: "Edit", okTitle: "Confirm", completion: completion)
        
    }
    
    
    func showConfirmAlert(amount:String,recipentID:String,completion:( (_ result: Bool) -> Void)?) {
        
        showAlert(title: "APP_NAME", message: "Please confirm \(amount) being sent to \(recipentID) is correct.", cancelTitle: "Edit", okTitle: "Confirm", completion: completion)
        
    }
    
    func showAlert(title:String,message:String,cancelTitle:String,okTitle:String,completion:( (_ result: Bool) -> Void)?) {
       
        if let app = UIApplication.shared.delegate, let window = app.window {
            // let window :UIWindow = UIApplication.shared.keyWindow!
            let alertController = UIAlertController(title: message, message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: okTitle, style: .default, handler: { (action) -> Void in
                completion?(true)
            })
            if !cancelTitle.isEmpty {
                let cancel = UIAlertAction(title: cancelTitle, style: .default, handler: { (action) -> Void in
                    completion?(false)
                })
                alertController.addAction(cancel)
            }
            alertController.addAction(ok)
            window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
      
    }
    
}





