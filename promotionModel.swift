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
    var kindPromotion: String
    var idProduct: String
    var productDescription: String
    var costProduct: String
    var endLineDate: String
    
    //var imagenPromo: NSimage
    
    init(r_idPromotion:String, r_category:String, r_description:String, r_kindPromotion: String, r_idProduct: String,  r_productDescription: String, r_costProduct: String, r_endLineDate: String){
        idPromotion = r_idPromotion
        category = r_category
        description = r_description
        kindPromotion = r_kindPromotion
        idProduct = r_idProduct
        productDescription = r_productDescription
        costProduct = r_costProduct
        endLineDate = r_endLineDate
    }
    
}