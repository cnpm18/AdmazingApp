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
    var idCategory: String = ""
    var name: String = ""
    var brand: String = ""
    var productDescription: String = ""
    var price: String = ""
    var origin: String = ""
    
    init (r_idProduct: String, r_idCategory: String, r_name: String, r_brand: String, r_productDescription: String, r_price: String ,r_origin: String){
        self.idProduct = r_idProduct
        self.idCategory = r_idCategory
        self.name = r_name
        self.brand = r_brand
        self.productDescription = r_productDescription
        self.price = r_price
        self.origin = r_origin
        
    }
}

