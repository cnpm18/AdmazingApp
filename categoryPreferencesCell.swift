//
//  categoryPreferencesCell.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 30/08/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit

class categoryPreferencesCell: UITableViewCell {

    @IBOutlet weak var logoCategory: UIImageView!
    @IBOutlet weak var nameCategory: UILabel!
    @IBOutlet weak var selectionCategory: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
