//
//  userModel.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 7/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class userModel{
    var idUser: String
    var userName: String
    var password: String
    
    
    
    init(r_idUser:String, r_userName:String, r_password:String) {
        self.idUser = r_idUser
        self.userName = r_userName
        self.password = r_password
    }
    
}