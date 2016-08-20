//
//  currentCoupon.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class currentProduct{
    var idProduct: String = ""
    var idCategory: String = ""
    var name: String = ""
    var brand: String = ""
    var productDescription: String = ""
    var price: String = ""
    var origin: String = ""
    
    
    
    init(){}
    
    
    init(coder aDecoder: NSCoder!) {
        self.idProduct=aDecoder.decodeObjectForKey("idProduct")as! String
        self.idCategory=aDecoder.decodeObjectForKey("idCategory")as! String
        self.name=aDecoder.decodeObjectForKey("name")as! String
        self.brand=aDecoder.decodeObjectForKey("brand")as! String
        self.productDescription=aDecoder.decodeObjectForKey("productDescription")as! String
        self.price=aDecoder.decodeObjectForKey("price")as! String
        self.origin=aDecoder.decodeObjectForKey("origin")as! String
        
    }
    
    func initWithCoder(aDecoder: NSCoder) -> currentProduct {
        self.idProduct=aDecoder.decodeObjectForKey("idProduct")as! String
        self.idCategory=aDecoder.decodeObjectForKey("idCategory")as! String
        self.name=aDecoder.decodeObjectForKey("name")as! String
        self.brand=aDecoder.decodeObjectForKey("brand")as! String
        self.productDescription=aDecoder.decodeObjectForKey("productDescription")as! String
        self.price=aDecoder.decodeObjectForKey("price")as! String
        self.origin=aDecoder.decodeObjectForKey("origin")as! String
        
        
        return self
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(idProduct, forKey: "idProduct")
        aCoder.encodeObject(idCategory, forKey: "idCategory")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(brand, forKey: "brand")
        aCoder.encodeObject(productDescription, forKey: "productDescription")
        aCoder.encodeObject(price, forKey: "price")
        aCoder.encodeObject(origin, forKey: "origin")
        
    }
    
}