//
//  promotionModel.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 7/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class promotionModel{
    var idPromotion: String = ""
    var idCategory: String = ""
    var idTypePromotion: String = ""
    var idStore: String = ""
    var promodescription: String = ""
    var startDate: String = ""
    var endDate: String = ""
    var imagePromotion: String = ""
    var idProduct: String = ""
    
    
    
    //var imagenPromo: NSimage
    
    init(r_idPromotion:String, r_idCategory:String, r_idTypePromotion:String, r_idStore: String, r_promodescription: String,  r_startDate: String, r_endDate: String, r_imagePromotion: String, r_idProduct: String){
        
        idPromotion = r_idPromotion
        idCategory = r_idCategory
        idTypePromotion = r_idTypePromotion
        idStore = r_idStore
        promodescription = r_promodescription
        startDate = r_startDate
        endDate = r_endDate
        imagePromotion = r_imagePromotion
        idProduct = r_idProduct
    }
    
}