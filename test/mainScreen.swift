//
//  mainScreen.swift
//  test
//
//  Created by Hackeru_Student on 6/11/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

class mainScreen: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource{
   
    
    //contener view
    var mainContiner : mainScreenContinerView!
    
    // activity indecator
    @IBOutlet weak var lodingPostsIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var menuTableView: UITableView!
    
    //main catagory array of names
  let catagoryName = ["פנאי ונופש","בעלי עסקים"]
  
    var catagoryImageName : [String] = []
    //refresher
    var refresher : UIRefreshControl?
    //category collection view out let
    @IBOutlet weak var MsGallryColaction: UICollectionView!
    
    //sub category  collection view
    @IBOutlet weak var subCatCollectionV: UICollectionView!
    
    
    //if the sub collection appear
    var subCollHide = true
    
    var array1 = ["one","one","one","one","one","one","one","one","one"]
    
    var array2 = ["tow"]
    
    var array : [String] = []
    
    var menuArray = ["הרשמה למשתמש","התחברות למשתמש","הרשמה לעסק","התחברות לעסק","תקנון ותנאי שימוש"]
    
    
   //view did load
    override func viewDidLoad() {
        super.viewDidLoad()
       
        hideMenuWhenTabAround()
        self.MsGallryColaction.delegate = self
        
       //get the the photos name from the plist
        if let path = Bundle.main.path(forResource: "imageArray", ofType: "plist"){
            let imageDic = NSDictionary(contentsOfFile: path)
            catagoryImageName = imageDic?.object(forKey: "catagory") as! [String]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != menuTableView {
            menuTableView.isHidden = true
        }
    }
    
    func hideMenuWhenTabAround()
    {
        //action = waht hppen when click out side the key board
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideMenuIfShown))
        
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideMenuIfShown()
    {
        if !menuTableView.isHidden {menuTableView.isHidden = true}
    }
  
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainContener"
        {
            self.mainContiner = segue.destination as! mainScreenContinerView
        }
//        if segue.identifier == "FromMainToBreg"
//        {
//            let bregster = segue.destination as! Bregister
//        }
    }
    
   
    
    
      //collection view functionalty
    
   //number of item in section
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
         print("numberOfItemInSection.array = \(array)")
        if collectionView == MsGallryColaction
        {
             return catagoryName.count
        }
        else
        {
            return array.count
        }
       
       
    }
       //cell for item at
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //category image
        if collectionView == MsGallryColaction
        {
            //defin the cell idntfair
            let cell = MsGallryColaction.dequeueReusableCell(withReuseIdentifier: "McGallry", for: indexPath) as! McGallry
            //set the cell text
            cell.txtViewMainCatagory.text = catagoryName[indexPath.row]
            cell.imgMainCatagory.image = UIImage(named:"red")
            print("cell for raw item = main cell")
            return cell
            
        }
          
        //posts cell
         else  
        {
            print("cell for raw item  = sub cell ")
            let subCell = subCatCollectionV.dequeueReusableCell(withReuseIdentifier:"subCell", for: indexPath) as! subCatagoryCell
            subCell.text.text = array[indexPath.row]
            
            return subCell
            
        }
        
    }
    
    //did select item at
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == MsGallryColaction
        {
            
            
            UIView.animate(withDuration: 0.2, animations:{self.chosenCat(catNum: indexPath.row)
                self.subCatCollectionV.reloadData()
            } )
            
            
//            DispatchQueue.main.async {
//
//            }
            
        }
       
         print("didSelectedItemAt.array = \(array)")
        
    }
    
    
    //chosin category
    func chosenCat(catNum : Int)
    {
        //chek if the sub cat collection view is hiding
        if subCollHide
        {
            subCatCollectionV.isHidden = false
        }
        
        
        else
        {
            
            self.subCollHide = true
            
        }
        
        if catNum == 0
        {
            array = array1
        }
            
        else
        {
            array = array2
        }
        
    }
    
    
    //posts
    @IBAction func showPostst(_ sender: Any) {//מועדפים
     //   mainContiner.segueIdentifierReceivedFromParent("mainPosts",catagory: "mainPostos")
        
        //show indecator
        
        lodingPostsIndicator.isHidden = false
        
        //start animate the indecator
        lodingPostsIndicator.startAnimating()
        
        performSegue(withIdentifier: "favo", sender: nil)
    }
    
    //sub catagory
    @IBAction func showSubCatagory(_ sender: Any) {//סל קניות
//       mainContiner.segueIdentifierReceivedFromParent("subCatagores")
        
        //stop animiting the indecator
        lodingPostsIndicator.stopAnimating()
        
        
    }
    //Menu Button
    @IBAction func MenuBtn(_ sender: Any) {
        menuTableView.isHidden = !menuTableView.isHidden
    }
   
    
    // home button
    @IBAction func btnHome(_ sender: Any) {
        //stop animaiting and hide the indecator an
        self.subCatCollectionV.isHidden = true
        self.subCollHide = true
    }
    
    @IBAction func ShopBtn(_ sender: Any) {
        
    }
    
    //table view func
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = menuArray[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == menuTableView {
            switch indexPath.row {
            case 0:
                print("NICE")
            case 1:
                performSegue(withIdentifier: "userLogin", sender: nil)
            case 2:
                performSegue(withIdentifier: "FromMainToBreg", sender: nil)
            case 3:
                print("NICE4")
            case 4:
                performSegue(withIdentifier: "privacyAndTerms", sender: nil)
            default:
                print("HTW")
            }
            menuTableView.isHidden = true
        }
    }
    
    
    
    //TODO
    //1- make the contener view and the sub catagory collecetion view the sam x and y ->
    //-> and the hgit and width
    //2- appeare the sub cat in async task
    
    
 
    
    

    
    
  
    
    

}
