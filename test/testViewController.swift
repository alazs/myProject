//
//  testViewController.swift
//  test
//
//  Created by Hackeru_Student on 6/24/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

class testViewController: UIViewController  {
   
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
       var mynumber = BcData(myFax: "000000")
        print(mynumber.reFax)
        mynumber.reFax = "11111"
        print(mynumber.reFax)
        mynumber.rePhone = "626262"
        print(mynumber.rePhone)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       
   
    
    

}
