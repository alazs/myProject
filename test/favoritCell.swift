//
//  favoritCell.swift
//  test
//
//  Created by Hackeru_Student on 7/15/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

class favoritCell: UITableViewCell {

    @IBOutlet var favTitle: UILabel!
    
    @IBOutlet var favIcon: UIImageView!
    
    @IBOutlet var favAbout: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
