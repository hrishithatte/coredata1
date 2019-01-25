//
//  cellTableViewCell.swift
//  coredata1
//
//  Created by Student-001 on 13/12/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit

class cellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbname: UILabel!
    
    @IBOutlet weak var lbemployID: UILabel!
    
    @IBOutlet weak var lbcontnmbr: UILabel!
    
    @IBOutlet weak var lbldep: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
