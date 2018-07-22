//
//  CustomVariableCell.swift
//  Catch Em Being Good POC
//
//  Created by Bonnie Chan on 7/21/18.
//  Copyright © 2018 TsangChan Inc. All rights reserved.
//

import UIKit

protocol CustomVariableCellDelegate {
    func didInputText(cell: CustomVariableCell)
}

class CustomVariableCell: UITableViewCell {

    @IBOutlet weak var variableTextbox: UITextField!
    var delegate: CustomVariableCellDelegate!
    var variableTextboxInput: String!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func inputChanged(_ sender: UITextField) {
        variableTextboxInput = sender.text!
        delegate.didInputText(cell: self)
    }
    
}
