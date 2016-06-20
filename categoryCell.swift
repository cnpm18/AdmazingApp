//
//  categoryCell.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 14/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit

class categoryCell: UITableViewCell {

    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryLogo: UIImageView!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
