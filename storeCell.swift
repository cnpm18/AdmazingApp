//
//  storeCell.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 13/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import UIKit

class storeCell: UITableViewCell {
   
    @IBOutlet weak var storeLogo: UIImageView!
    @IBOutlet weak var storeName: UILabel!
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
