//
//  customCell.swift
//  distance
//
//  Created by SVECW-5 on 25/09/18.
//  Copyright © 2018 SVECW-5. All rights reserved.
//

import UIKit
import Foundation

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var lab: UILabel!
        override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(animated, animated: true)
    }
}
