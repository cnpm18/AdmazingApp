//
//  productModel.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 21/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class productModel{
    var idProduct: String = ""
    var nameProduct: String = ""
    var tradeProduct: String = ""
    var description: String = ""
    var costProduct: String = ""
    init (r_idProduct: String, r_nameProduct: String, r_tradeProduct: String, r_description: String, r_costProduct: String){
        self.idProduct = r_idProduct
        self.nameProduct = r_nameProduct
        self.tradeProduct = r_tradeProduct
        self.description = r_description
        self.costProduct = r_costProduct
        
    }
}