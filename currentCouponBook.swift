//
//  currentCouponBook.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 22/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class currentCouponBook{
    var currentCouponBookId: String
    
    init(r_currentCouponBookId: String)
    {
        self.currentCouponBookId = r_currentCouponBookId
        
    }
    
    func getCurrentCouponBookId() -> String{
        return self.currentCouponBookId
    }
    
    
    func setCurrentCouponBookId(r_currentCouponBookId: String){
        self.currentCouponBookId = r_currentCouponBookId
        
    }
   
    
    
    init(coder aDecoder: NSCoder!) {
        self.currentCouponBookId = aDecoder.decodeObjectForKey("currentCouponBookId") as! String
        
    }
    
    func initWithCoder(aDecoder: NSCoder) -> currentCouponBook {
        self.currentCouponBookId = aDecoder.decodeObjectForKey("currentCouponBookId") as! String
        
        return self
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(currentCouponBookId, forKey: "currentCouponBookId")
    }
    
}
