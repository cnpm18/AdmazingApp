//
//  currentStore.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class currentStore{
    var currentStoreId: String
    var  currentStoreName: String
    var currentStoreIconName: String
    var currentStoreIndex: Int
    init(r_currentStoreId: String, r_currentStoreName: String, r_currentStoreIconName: String,r_currentStoreIndex: Int )
    {
        self.currentStoreId = r_currentStoreId
        self.currentStoreName = r_currentStoreName
        self.currentStoreIconName = r_currentStoreIconName
        self.currentStoreIndex = r_currentStoreIndex
    }
    
    
    func getCurrentStoreId() -> String{
        return self.currentStoreId
    }
    func getCurrentStoreName() -> String{
        return self.currentStoreName
    }
    func getCurrentStoreIconName() -> String{
        return self.currentStoreIconName
    }
    func getCurrentStoreIndex() -> Int{
        return self.currentStoreIndex
    }
    
    func setCurrentStoreId(r_currentStoreId: String){
        self.currentStoreId = r_currentStoreId
        
    }
    func setCurrentStoreName(r_currentStoreName: String){
        self.currentStoreName = r_currentStoreName
        
    }
    func setCurrentStoreIconName(r_currentStoreIconName: String){
        self.currentStoreIconName = r_currentStoreIconName
        
    }
    func setCurrentStoreIndex(r_currentStoreIndex: Int){
        self.currentStoreIndex = r_currentStoreIndex
        
    }
    
    init(coder aDecoder: NSCoder!) {
        self.currentStoreId = aDecoder.decodeObjectForKey("currentStoreId") as! String
        self.currentStoreName = aDecoder.decodeObjectForKey("currentStoreName") as! String
        self.currentStoreIconName = aDecoder.decodeObjectForKey("currentStoreIconName") as! String
        self.currentStoreIndex = aDecoder.decodeObjectForKey("currentStoreIndex") as! Int
    }
    
    func initWithCoder(aDecoder: NSCoder) -> currentStore {
        self.currentStoreId = aDecoder.decodeObjectForKey("currentStoreId") as! String
        self.currentStoreName = aDecoder.decodeObjectForKey("currentStoreName") as! String
        self.currentStoreIconName = aDecoder.decodeObjectForKey("currentStoreIconName") as! String
        self.currentStoreIndex = aDecoder.decodeObjectForKey("currentStoreIndex") as! Int
        return self
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(currentStoreId, forKey: "currentStoreId")
        aCoder.encodeObject(currentStoreName, forKey: "currentStoreName")
        aCoder.encodeObject(currentStoreIconName, forKey: "currentStoreIconName")
        aCoder.encodeObject(currentStoreIndex, forKey: "currentStoreIndex")
    }


    
}