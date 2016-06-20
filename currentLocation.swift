//
//  currentLocation.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class currentLocation{
    var latitude: String
    var longitude: String
    init(r_latitude:String,r_longitude:String)
    {
        self.latitude = r_latitude
        self.longitude = r_longitude
        
    }
    
    func getLatitude() -> String{
        return self.latitude
    }
    func getLongitude() -> String{
        return self.longitude
    }
    
    func setLatitude(r_latitude: String){
        self.latitude = r_latitude
        
    }
    func setLongitude(r_longitude: String){
        self.longitude = r_longitude
        
    }
    
    init(coder aDecoder: NSCoder!) {
        self.latitude = aDecoder.decodeObjectForKey("latitude") as! String
        self.longitude = aDecoder.decodeObjectForKey("longitude") as! String
       
    }
    
    func initWithCoder(aDecoder: NSCoder) -> currentLocation {
        self.latitude = aDecoder.decodeObjectForKey("latitude") as! String
        self.longitude = aDecoder.decodeObjectForKey("longitude") as! String
        
        return self
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(latitude, forKey: "latitude")
        aCoder.encodeObject(longitude, forKey: "longitude")
        
    }

    

}