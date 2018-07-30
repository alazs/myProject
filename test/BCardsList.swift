//
//  BCardsList.swift
//  test
//
//  Created by Hackeru_Student on 7/30/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

class BCardsList: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var BCardLists: UITableView!
    
    //array of Busi names
   // private var  businessNames = [String]()
    
   let businessNames = ["B1","B2","b3","B1","B2","b3"]
    
    //array of Busi icons
    private var  busissImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // list of card business cards methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return businessNames.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       
        let cell = BCardLists.dequeueReusableCell(withIdentifier: "BCardListCell", for: indexPath) as! BCardListsCell
        
       // cell.BcardListName.text = businessNames[indexPath.row]
        cell.BcardListName.text = "d"
        
        cell.BCardListImg.image = UIImage(named: "red")!
        
        
        return cell
    }
    
}
