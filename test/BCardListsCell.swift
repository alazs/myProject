//
//  BCardListsCell.swift
//  test
//
//  Created by Hackeru_Student on 7/30/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import UIKit

class BCardListsCell: UITableViewCell {
    //icon of the businesse
    @IBOutlet var BCardListImg: UIImageView!
    
    //name of the businesse
    @IBOutlet var BcardListName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
