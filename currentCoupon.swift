//
//  currentCoupon.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class currentCoupon{
    var currentCouponName: String
    var currentCouponIconName: String
    var currentCouponDescription: String
    var currentCouponIndex: Int
    init()
    {
        self.currentCouponName = ""
        self.currentCouponIconName = ""
        self.currentCouponDescription = ""
        self.currentCouponIndex = 0
    }
    
    func getCurrentCouponName() -> String{
        return self.currentCouponName
    }
    func getCurrentCouponIconName() -> String{
        return self.currentCouponIconName
    }
    func getCurrentCouponIndex() -> Int{
        return self.currentCouponIndex
    }
    func getCurrentCouponDescription() -> String{
        return self.currentCouponDescription
    }
    
    func setCurrentCouponName(r_currentCouponName: String){
        self.currentCouponName = r_currentCouponName
        
    }
    func setCurrentCouponIconName(r_currentCouponIconName: String){
        self.currentCouponIconName = r_currentCouponIconName
        
    }
    func setCurrentCouponIndex(r_currentCouponIndex: Int){
        self.currentCouponIndex = r_currentCouponIndex
        
    }
    func setCurrentCouponDescription(r_currentCouponDescription: String){
        self.currentCouponDescription = r_currentCouponDescription
        
    }

    
    
    init(coder aDecoder: NSCoder!) {
        self.currentCouponName = aDecoder.decodeObjectForKey("currentCouponName") as! String
        self.currentCouponIconName = aDecoder.decodeObjectForKey("currentCouponIconName") as! String
        self.currentCouponDescription = aDecoder.decodeObjectForKey("currentCouponDescription") as! String
        self.currentCouponIndex = aDecoder.decodeObjectForKey("currentCouponIndex") as! Int
    }
    
    func initWithCoder(aDecoder: NSCoder) -> currentCoupon {
        self.currentCouponName = aDecoder.decodeObjectForKey("currentCouponName") as! String
        self.currentCouponIconName = aDecoder.decodeObjectForKey("currentCouponIconName") as! String
        self.currentCouponDescription = aDecoder.decodeObjectForKey("currentCouponDescription") as! String
        self.currentCouponIndex = aDecoder.decodeObjectForKey("currentCouponIndex") as! Int
        return self
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(currentCouponName, forKey: "currentCouponName")
        aCoder.encodeObject(currentCouponIconName, forKey: "currentCouponIconName")
        aCoder.encodeObject(currentCouponDescription, forKey: "currentCouponDescription")
        aCoder.encodeObject(currentCouponIndex, forKey: "currentCouponIndex")
    }

}