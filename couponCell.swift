//
//  couponCell.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 15/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit

class couponCell: UITableViewCell {

    
    @IBOutlet weak var promoDescription: UILabel!
    @IBOutlet weak var promoImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
