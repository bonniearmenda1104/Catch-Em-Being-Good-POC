//
//  CustomRecurringCell.swift
//  Catch Em Being Good POC
//
//  Created by Bonnie Chan on 1/30/17.
//  Copyright © 2017 TsangChan Inc. All rights reserved.
//

import UIKit
protocol CustomRecurringCellDelegate {
    func didTapSwitch(cell: CustomRecurringCell)
}

class CustomRecurringCell: UITableViewCell {
    
    @IBOutlet weak var recurringToggle: UISwitch!
    var delegate: CustomRecurringCellDelegate!
    //var callback: ((_ switch: UISwitch)->Void)?
    //var toggleValue: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func recurringToggleChanged(_ sender: UISwitch) {
        delegate.didTapSwitch(cell: self)
    }
    
}
