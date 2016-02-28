//
//  RegistrationEndTableViewCell.swift
//  DoctorsApp
//
//  Created by Jonathan Decorion on 28/02/2016.
//  Copyright © 2016 Jonathan Decorion. All rights reserved.
//

import UIKit
protocol RegistrationEndTableViewCellDelegate{
    func didTappedSwitch(cell: RegistrationEndTableViewCell)
    
}

class RegistrationEndTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sw: UISwitch!
    @IBOutlet weak var abbr: UILabel!
    var delegate:RegistrationEndTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func switchValueChanged(sender: AnyObject) {
        delegate.didTappedSwitch(self)
    }
    
    
    func setUpWithModel(model:CDegree)
    {
        name.text = model.name
        abbr.text = model.abbr
        sw.setOn(model.isSelected, animated: false)
    }
  
/*
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    */
    
}
