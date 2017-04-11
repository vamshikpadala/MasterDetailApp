//
//  MenuCell.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 4/9/17.
//  Copyright © 2017 Vamshi krishna Padala. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
