//
//  storeModel.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 7/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class storeModel{
    var idStore: String
    var idCommercialArea: String
    var nameStore: String
    var email: String
    var phoneNumber: String
    var imageStore: String
    
    init(r_idStore: String, r_idCommercialArea: String, r_nameStore: String, r_email:String, r_phoneNumber: String,r_imageStore: String) {
        self.idStore=r_idStore
        self.idCommercialArea=r_idCommercialArea
        self.nameStore=r_nameStore
        self.email=r_email
        self.phoneNumber=r_phoneNumber
        self.imageStore=r_imageStore
        
        
    }
    
}