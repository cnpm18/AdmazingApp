//
//  currentLog.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class currentLog{
    var userName: String
    var password: String
    init(r_userName:String,r_password:String)
    {
        self.userName = r_userName
        self.password = r_password
        
    }
    func getUserName() -> String{
        return self.userName
    }
    func getPassword() -> String{
        return self.password
    }
    
    func setIdPromocion(r_userName: String){
        self.userName = r_userName
        
    }
    func setPassword(r_password: String){
        self.password = r_password
        
    }
    
    init(coder aDecoder: NSCoder!) {
        self.userName = aDecoder.decodeObjectForKey("userName") as! String
        self.password = aDecoder.decodeObjectForKey("password") as! String
        
    }
    
    func initWithCoder(aDecoder: NSCoder) -> currentLog {
        self.userName = aDecoder.decodeObjectForKey("userName") as! String
        self.password = aDecoder.decodeObjectForKey("password") as! String
        
        return self
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(userName, forKey: "userName")
        aCoder.encodeObject(password, forKey: "password")
        
    }


    
}