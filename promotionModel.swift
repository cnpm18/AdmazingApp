//
//  promotionModel.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 7/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class promotionModel{
    var idPromotion: String
    var category: String
    var description: String
    //var imagenPromo: NSimage
    
    init(r_idPromotion:String,r_category:String,r_description:String ){
        idPromotion = r_idPromotion
        category = r_category
        description = r_description
    }
    
}