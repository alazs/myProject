//
//  chickInternetConnection.swift
//  test
//
//  Created by Hackeru_Student on 7/17/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

class chickInternetConnection
{
    var view = UIView()
    //toast
    let toast = UIView()
    
    //toast leable
    let  toastLable = UILabel()
    
    //toast button
    let toastButton = UIButton()
    
    init()
    {
        //empty constractor
    }
    
    init(myView:UIView)
    {
        self.view = myView
    }
  
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    
   
    //message about internet connection
    //show toast
    // func toast(_ myToast : String ,toast: UIView,toastButton : UIButton,toastLable : UILabel)
    func toast(_ myToast : String )
    {
        
        //get the super view width
       let superViewWidth = self.view.frame.width
        
        
        toast.frame = CGRect(x: 2, y: 64, width:superViewWidth - 5 , height: 450)
        
        toast.backgroundColor = UIColor.lightGray
        
        //make rounded corners to the view
        toast.layer.cornerRadius = 25
        
        //adding leable
        let stringLength = myToast.count
        
        toastLable.frame = CGRect(x: 50, y: 150 , width: stringLength * 10 + 5, height: 50)
        
        toastLable.textAlignment = .center
        
        toastLable.text = myToast
        
        toastLable.clipsToBounds = true
        toast.addSubview(toastLable)
        
        //adding button
        toastButton.frame = CGRect(x: 10, y: 10, width: 70, height: 70)
        toastButton.addTarget(self, action:#selector(buttonAction) , for: .touchUpInside)
        //transfer the toast as paramter thrw the sender of the button
        toastButton.setTitle("✕", for: .normal)
        
        toast.addSubview(toastButton)
        
        //adding UIview as subView
        self.view.addSubview(toast)
        
        
        
    }
    
    
    
    @objc func buttonAction(_ sender : UIButton!)
    {
     self.toast.removeFromSuperview()
    }
    
    
   
    
}



  
    
    

