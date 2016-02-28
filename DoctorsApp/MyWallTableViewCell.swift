//
//  MyWallTableViewCell.swift
//  DoctorsApp
//
//  Created by Jonathan Decorion on 18/02/2016.
//  Copyright © 2016 Jonathan Decorion. All rights reserved.
//

import UIKit

class MyWallTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profile: UIImageView!
    
    
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var position: UILabel!
    
    
    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var comment: UILabel!
    
    @IBOutlet weak var img: UIImageView!
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
