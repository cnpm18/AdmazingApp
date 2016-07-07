//
//  currentCategory.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class currentCategory{
    var currentCategoryID: String
    var currentCategoryName: String
    var currentCategoryIconName: String
    var currentCategoryIndex: Int
    init(r_currentCategoryID: String, r_currentCategoryName:String,r_currentCategoryIconName:String,r_currentCategoryIndex:Int)
    {
        self.currentCategoryID=r_currentCategoryID
        self.currentCategoryName = r_currentCategoryName
        self.currentCategoryIconName = r_currentCategoryIconName
        self.currentCategoryIndex = r_currentCategoryIndex
    }
    
    func getCurrentCategoryName() -> String{
        return self.currentCategoryName
    }
    func getCurrentCategoryIconName() -> String{
        return self.currentCategoryIconName
    }
    func getCurrentCategoryIndex() -> Int{
        return self.currentCategoryIndex
    }
    
    func setCurrentCategoryName(r_currentCategoryName: String){
        self.currentCategoryName = r_currentCategoryName
        
    }
    func setCurrentCategoryIconName(r_currentCategoryIconName: String){
        self.currentCategoryIconName = r_currentCategoryIconName
        
    }
    func setCurrentCategoryIndex(r_currentCategoryIndex: Int){
        self.currentCategoryIndex = r_currentCategoryIndex
        
    }
    init(coder aDecoder: NSCoder!) {
        self.currentCategoryID = aDecoder.decodeObjectForKey("currentCategoryID") as! String
        self.currentCategoryName = aDecoder.decodeObjectForKey("currentCategoryName") as! String
        self.currentCategoryIconName = aDecoder.decodeObjectForKey("currentCategoryIconName") as! String
        self.currentCategoryIndex = aDecoder.decodeObjectForKey("currentCategoryIndex") as! Int
    }
    
    func initWithCoder(aDecoder: NSCoder) -> currentCategory {
        self.currentCategoryID = aDecoder.decodeObjectForKey("currentCategoryID") as! String
        self.currentCategoryName = aDecoder.decodeObjectForKey("currentCategoryName") as! String
        self.currentCategoryIconName = aDecoder.decodeObjectForKey("currentCategoryIconName") as! String
        self.currentCategoryIndex = aDecoder.decodeObjectForKey("currentCategoryIndex") as! Int

        return self
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(currentCategoryID, forKey: "currentCategoryID")
        aCoder.encodeObject(currentCategoryName, forKey: "currentCategoryName")
        aCoder.encodeObject(currentCategoryIconName, forKey: "currentCategoryIconName")
        aCoder.encodeObject(currentCategoryIndex, forKey: "currentCategoryIndex")
    }


}