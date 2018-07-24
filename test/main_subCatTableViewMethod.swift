//
//  main&subCatTableViewMethod.swift
//  test
//
//  Created by Hackeru_Student on 6/28/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//


import UIKit
import Foundation
class mainSubCatTableViewMethod :NSObject, UICollectionViewDelegate,UICollectionViewDataSource
{
   
    
    
    var array : [String] = []
    
    var mainScreenContinerView : mainScreenContinerView!
    var mymainScreen : mainScreen!
    
    let array1 = ["array1"]
    
    let array2 = ["array2"]
    
    let catagoryName = ["פנאי ונופש","בעלי עסקים"]
    
    var myCatCollec : UICollectionView!
   public var moveClass = 0
   public var myCat : Int = 0
    
    init(catColle : UICollectionView,myClass : Int) {
        super.init()
        if myCat  == 0
        {
            array = array1
        }
        else{
            array = array2
        }
        print("selected category = \(myCat)")
        print("\(array)")
        self.moveClass = myClass
        self.myCatCollec = catColle
        self.myCatCollec.dataSource = self
        self.myCatCollec.delegate = self
        
      //  myCatCollec = nil
        

    }
   
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            print("extrnal collectionView methods")
           print("index row . mycat select = \(myCat)")
        
        if moveClass == 0
        {
            return catagoryName.count
            
        }
        
        else{
            return array.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if myCat  == 0
        {
            array = array1
        }
        else{
            array = array2
        }
        //getCatNum()
            if moveClass == 0 {
            
            let cell = myCatCollec.dequeueReusableCell(withReuseIdentifier: "McGallry", for: indexPath) as! McGallry
            cell.txtViewMainCatagory.text = catagoryName[indexPath.row]
            return cell
            
        }
        
        else{
            let cell = myCatCollec.dequeueReusableCell(withReuseIdentifier: "subCell", for: indexPath) as! subCatagoryCell
            cell.text.text = array[indexPath.row]
            return cell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("selected")
        
        
        }
  
      
    
    
    
    
    
    }
