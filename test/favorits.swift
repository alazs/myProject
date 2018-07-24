//
//  favorits.swift
//  test
//
//  Created by Hackeru_Student on 7/15/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

class favorits: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    //table view refraince
    @IBOutlet var favTableView: UITableView!
    
    //favorit core data refrince
    let myFavoritCoreData = favoritesCoreData()
    
    // array of the favorits
    var favArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favArray = myFavoritCoreData.retriveData()
        
        

    }

    
    
    // table view functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = favTableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! favoritCell
        myCell.favIcon.image = UIImage(named: "red")
        myCell.favTitle.text = favArray[indexPath.row]
        return myCell
    }
    
    //did select
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //delet chosin favorits
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if  editingStyle == UITableViewCellEditingStyle.delete
        {
            let d = favArray[indexPath.row]
            //delet from coreData
            myFavoritCoreData.deletSpcficBi(myDelet: d)
            
            //delet from array
            favArray.remove(at: indexPath.row)
            
            //update the table view
            favTableView.reloadData()
        }
        
    }
    
    
    //delet all the core data

    @IBAction func deletAllEntitiy(_ sender: UIButton) {
        
       myFavoritCoreData.deletAllEntity()
        
        favTableView.reloadData()
        
    }
    @IBAction func delet(_seder: UIButton)
    {
        myFavoritCoreData.saveFavorites(busiFavName: "f", busiFavLink: "dd")
    }
    
    
    
    
}
