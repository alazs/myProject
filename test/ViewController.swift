//
//  ViewController.swift
//  test
//
//  Created by Hackeru_Student on 6/9/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var container : ContainerViewController!
    //business Card logo image
    @IBOutlet weak var BcLogo: UIImageView!
    
    //navigation button
    @IBOutlet weak var BcNov: UIButton!
    
    //call button
    @IBOutlet weak var BcCall: UIButton!
    
    //fevorite button
    @IBOutlet weak var BcFav: UIButton!
    
    //menu Button
    @IBOutlet weak var BcMenu: UIButton!
    
    //sheare Button
    @IBOutlet weak var BcSh: UIButton!
    
    //about text
    @IBOutlet weak var BcAbout: UITextView!
    
    //status
    @IBOutlet weak var BcStatus: UILabel!
    
    //rating
    @IBOutlet weak var BcRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Welcome")
        circleImage()
    }
    
    //create circelar image
    private func circleImage()
    {
        BcLogo.layer.cornerRadius = BcLogo.frame.size.width/1.3
        BcLogo.clipsToBounds = true
      
    }
    
    
    @IBAction func buttonArePress(_ sender: UIButton) {
        switch sender {
        //navigation button
        case BcNov:
            //do somthing
            container.segueIdentifierReceivedFromParent("first")
            print("btn1")
            
        //call button
        case BcCall:
    
             makeCall(123456789)
            container.segueIdentifierReceivedFromParent("scond")
            print("btn2")
            
        //fevorite button
        case BcFav:
            print("btn3")
            
        //menu Button
        case BcMenu:
           
            print("btn4")
            
        //sheare Button
        case BcSh:
            print("btn5")
            
            
        default:
            print("defaalt")
            return
        }
        
    }
    
    //adding rating
    @IBAction func BcAddRating(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"
        {
            self.container = segue.destination as! ContainerViewController
        }
        
    }
    
    //macke a phoneCall
    private func makeCall(_ number : Int?)
    {
        if let url = URL(string: "tel://\(number!)")
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
        else
        {
            return
        }
       
    }
    
    
}

