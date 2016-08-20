//
//  currentCoupon.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class currentCoupon{
    var idPromotion: String = ""
    var idCategory: String = ""
    var idTypePromotion: String = ""
    var idStore: String = ""
    var promodescription: String = ""
    var startDate: String = ""
    var endDate: String = ""
    var imagePromotion: String = ""
    var idProduct: String = ""

    init(){
    }
    
    
    
    
    init(coder aDecoder: NSCoder!) {
        self.idPromotion=aDecoder.decodeObjectForKey("idPromotion")as! String
        self.idCategory=aDecoder.decodeObjectForKey("idCategory")as! String
        self.idTypePromotion=aDecoder.decodeObjectForKey("idTypePromotion")as! String
        self.idStore=aDecoder.decodeObjectForKey("idStore")as! String
        self.promodescription=aDecoder.decodeObjectForKey("promodescription")as! String
        self.startDate=aDecoder.decodeObjectForKey("startDate")as! String
        self.endDate=aDecoder.decodeObjectForKey("endDate")as! String
        self.imagePromotion=aDecoder.decodeObjectForKey("imagePromotion")as! String
        self.idProduct=aDecoder.decodeObjectForKey("idProduct")as! String
        
    }
    
    func initWithCoder(aDecoder: NSCoder) -> currentCoupon {
        self.idPromotion=aDecoder.decodeObjectForKey("idPromotion")as! String
        self.idCategory=aDecoder.decodeObjectForKey("idCategory")as! String
        self.idTypePromotion=aDecoder.decodeObjectForKey("idTypePromotion")as! String
        self.idStore=aDecoder.decodeObjectForKey("idStore")as! String
        self.promodescription=aDecoder.decodeObjectForKey("promodescription")as! String
        self.startDate=aDecoder.decodeObjectForKey("startDate")as! String
        self.endDate=aDecoder.decodeObjectForKey("endDate")as! String
        self.imagePromotion=aDecoder.decodeObjectForKey("imagePromotion")as! String
        self.idProduct=aDecoder.decodeObjectForKey("idProduct")as! String

        
        return self
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(idPromotion, forKey: "idPromotion")
        aCoder.encodeObject(idCategory, forKey: "idCategory")
        aCoder.encodeObject(idTypePromotion, forKey: "idTypePromotion")
        aCoder.encodeObject(idStore, forKey: "idStore")
        aCoder.encodeObject(promodescription, forKey: "promodescription")
        aCoder.encodeObject(startDate, forKey: "startDate")
        aCoder.encodeObject(endDate, forKey: "endDate")
        aCoder.encodeObject(imagePromotion, forKey: "imagePromotion")
        aCoder.encodeObject(idProduct, forKey: "idProduct")
        
    }

}