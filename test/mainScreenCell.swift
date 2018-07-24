//
//  mainScreenCell.swift
//  test
//
//  Created by Hackeru_Student on 6/15/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

class mainScreenCell: UICollectionViewCell {
    
   
    var mainPost : mainPostViewController?
    // post image
    @IBOutlet weak var iconPost: UIImageView!
    
    //post text
    @IBOutlet weak var postText: UITextView!
    
    //post Image
    @IBOutlet weak var postImage: UIImageView!
//post title
    
    @IBOutlet weak var postTitle: UILabel!
   //make the icon round
    func roundIcon() {
        iconPost.layer.cornerRadius = iconPost.frame.size.width/2
        iconPost.clipsToBounds = true
    }
    
    //comment button
    //give commetn for spcific bessnis
    @IBAction func MpBtnComment(_ sender: Any) {
        //TODO : give a commetn for spcific bessnis
        mainPost?.activityIndecator.startAnimating()
        print("comment has given")
    }
    
    //give like for spcific bessnis
    @IBAction func MpBtnLike(_ sender: Any) {
        mainPost?.activityIndecator.stopAnimating()
        print("like has given")
    }
    
    
    
}
