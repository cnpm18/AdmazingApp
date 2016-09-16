//
//  storeByIdConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 15/09/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
//<adm:getStoreByIdRequest><idStore>EP000015</idStore></adm:getStoreByIdRequest>

class storesByIdConnection: serverConnection {
    
    var r_idStore: String = ""
    var result: Bool = false
    
    var store = storeModel(r_idStore: "", r_idCommercialArea: "", r_nameStore: "", r_email: "", r_phoneNumber: "", r_imageStore: "", r_longitude: "", r_latitude: "", r_floor: "")
    
    var idStore: String = ""
    var nameStore: String = ""
    var email: String = ""
    var phoneNumber: String = ""
    var idCommercialArea: String = ""
    var imageStore: String = ""
    var latitude: String = ""
    var longitude: String = ""
    var floor: String = ""
    
    
    
    
    func setr_idStore( idStore: String ){
        r_idStore = idStore
        
    }
    func getResponse(){
        
        let body = "<adm:getStoreByIdRequest><idStore>\(r_idStore)</idStore></adm:getStoreByIdRequest>"
        createConnection(body)
        
    }
    
    override func parser(parser: NSXMLParser, foundCharacters string: String) {
        
        
        switch currentElementName {
        case "idStore":
            self.idStore = self.idStore + string
            
            
        case "idCommercialArea":
            self.idCommercialArea = self.idCommercialArea + string
            
            
        case "nameStore":
            self.nameStore = self.nameStore + string
            
        case "email":
            self.email = self.email + string
            
            
        case "phoneNumber":
            self.phoneNumber = self.phoneNumber + string
            
            
        case "imageStore":
            self.imageStore = self.imageStore + string
            
            
        case "level":
            self.floor = self.floor + string
            
            
        case "longitude":
            self.longitude = self.longitude + string
            
            
        case "latitude":
            self.latitude = self.latitude + string
            fillObject()
            
            
            
            
            
        default: break
        }
        
        
        
    }
    
    func fillObject(){
        
        
        
        store.idStore=self.idStore
        store.idCommercialArea=self.idCommercialArea
        store.nameStore=self.nameStore
        store.email=self.email
        store.phoneNumber=self.phoneNumber
        store.imageStore=self.imageStore
        store.longitude=self.longitude
        store.latitude=self.latitude
        store.floor=self.floor
        
        
        self.idStore=""
        self.nameStore=""
        self.email=""
        self.phoneNumber=""
        self.idCommercialArea=""
        self.imageStore=""
        self.latitude=""
        self.longitude=""
        self.floor=""
        
    }
    
    func returnData(data:String){
        if data == "true"{
            self.result = true
        }
        else{
            
            self.result = false
        }
        
        
    }
    func getResult()->storeModel{
        
        return self.store
    }
    
    
    
}