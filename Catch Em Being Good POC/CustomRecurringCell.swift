//
//  CustomRecurringCell.swift
//  Catch Em Being Good POC
//
//  Created by Bonnie Chan on 1/30/17.
//  Copyright © 2017 TsangChan Inc. All rights reserved.
//

import UIKit

class CustomRecurringCell: UITableViewCell {
    
    var toggleValue = Bool()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func recurringToggle(_ sender: UISwitch) {
        toggleValue = sender.isOn
    }
    
}
