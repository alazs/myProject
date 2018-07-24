//
//  mainPostViewController.swift
//  test
//
//  Created by Hackeru_Student on 6/15/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

class mainPostViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    //activity indecator
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    
    //collection view outlet
    @IBOutlet weak var postCollecationView: UICollectionView!
    
    //test array
    let tetArray = ["alaa","alaa","alaa","alaa","alaa","alaa","alaa"]
    
    //view did load 
    override func viewDidLoad() {
        super.viewDidLoad()

        //inshlize collectionView
        postCollecationView.dataSource=self
        postCollecationView.delegate=self
        
    }
    // collection view methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tetArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postCollecationView.dequeueReusableCell(withReuseIdentifier: "mainScreenCell", for: indexPath) as! mainScreenCell
        cell.roundIcon()
       cell.iconPost.image = UIImage(named: "red")
        cell.postImage.image = UIImage(named: "blue")
        cell.postTitle.text = tetArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if activityIndecator.isAnimating
//        {
//             activityIndecator.stopAnimating()
//            activityIndecator.isHidden = true
//            
//        }
//        else
//        {
//             activityIndecator?.startAnimating()
//            
//        }
//       
        
        
    }
    
    
    //load all the posts in the main screen
    
    func getPosts()
    {
        
        //note: start loading activity
        //activityIndecator.startAnimating()
        
        //note:stop loading activity
       activityIndecator.stopAnimating()
    }
    

}
