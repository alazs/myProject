//
//  BcAboutClass.swift
//  test
//
//  Created by Hackeru_Student on 6/10/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

class BcAboutClass: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //mobile number
    @IBOutlet weak var BcMoblieNumber: UILabel!
    //fax
    @IBOutlet weak var BcFax: UILabel!
    
    //email
    @IBOutlet weak var BcEmail: UILabel!
    
    //website
    @IBOutlet weak var BcWebsite: UILabel!
    
    //statuse
    @IBOutlet weak var BcStatuse: UILabel!
    
    var Rating = [0,0,0]
    
    
   var myArray = [UIImage(named: "blue"),UIImage(named: "green"),UIImage(named: "black"),UIImage(named: "pink") , UIImage(named: "yellow" ),]
    //var myArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "BcGallry", for:indexPath ) as! BcGallry
        cell.BcImaGallry.image = myArray[indexPath.row]
        return cell
        
    }
    
    //raiting

    @IBOutlet var outletCollectionRating: [UIButton]!
    
    @IBAction func btnRating(_ sender: UIButton) {
        
        let tag = sender.tag
        
        var cat = 0
        
        if tag <= 5 {cat = 0}
            
        else if tag <= 10 {cat = 1}
            
        else{cat = 2}
        
        for button in outletCollectionRating{
            if button.tag >= 1 + (cat * 5) && button.tag <= 5 + (cat * 5){
                if button.tag <= tag
                {
                    button.setTitle("★",for: .normal)
                    button.titleLabel?.font = UIFont(name: (button.titleLabel?.font.fontName)!, size: 24)
                    
                }else{
                    button.setTitle("☆", for: .normal)
                }
            }
        }
        Rating[cat] = tag - (5 * cat)
        
    }
    

    
    @IBAction func btnSTar(_ sender: Any) {
        print("star")
    }
    
    @IBAction func newbtn(_ sender: Any) {
        print("new button")
    }
    
    @IBAction func btnRate(_ sender: UIButton) {
        print(Rating)
        print("you have rate")
    }
    
    
    
    
}
