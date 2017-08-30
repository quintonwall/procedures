//
//  ProcedureTableViewCell.swift
//  BProcedures
//
//  Created by Quinton Wall on 8/22/17.
//  Copyright © 2017 Quinton Wall. All rights reserved.
//

import UIKit

class ProcedureTableViewCell: UITableViewCell {

    @IBOutlet weak var subject: UILabel!
    var procedure : Procedure?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
