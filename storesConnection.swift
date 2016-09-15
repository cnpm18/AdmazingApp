//
//  storesConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 6/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class storesConnection: serverConnection {
    
    var r_userName: String = ""
    var result: Bool = false
    var stores: [storeModel] = []
    
    var idStore: String = ""
    var nameStore: String = ""
    var email: String = ""
    var phoneNumber: String = ""
    var idCommercialArea: String = ""
    var imageStore: String = ""
    var latitude: String = ""
    var longitude: String = ""
    var floor: String = ""
    
    
    
    
    func setr_userName( userName: String ){
        r_userName = userName
        
    }
    func getResponse(){
        
        let body = "<adm:getAllStoresbyCommercialAreaRequest><idUser>\(r_userName)</idUser></adm:getAllStoresbyCommercialAreaRequest>"
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
        
        stores.append(storeModel(r_idStore: idStore, r_idCommercialArea: idCommercialArea, r_nameStore: nameStore, r_email: email, r_phoneNumber: phoneNumber, r_imageStore: imageStore,  r_longitude: longitude, r_latitude: latitude, r_floor: floor))
        
       
        print(stores)
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
    func getResult()->[storeModel]{
        print(stores)
        return self.stores
    }
    
    
    
}