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
    
    
    
    
    func setr_userName( userName: String ){
        r_userName = userName
        
    }
    func getResponse(){
        
        let body = "<adm:getAllTiendabyZonaComercialRequest><idUsuario>\(r_userName)</idUsuario></adm:getAllTiendabyZonaComercialRequest>"
        createConnection(body)
        
    }
    
    override func parser(parser: NSXMLParser, foundCharacters string: String) {
        
        print("entro!")
        print(string)
            switch currentElementName {
            case "codigo":
                self.idStore = self.idStore + string
                print(idStore)
                
            case "zonacomercial":
                self.idCommercialArea = self.idCommercialArea + string
                print(idCommercialArea)
                
            
            case "razonsocial":
                self.nameStore = self.nameStore + string
                print(nameStore)
                
            case "email":
                self.email = self.email + string
                print(email)
                
            case "telefono":
                self.phoneNumber = self.phoneNumber + string
                fillObject()
                print(phoneNumber)
                
            
            default: break
            }
        
        
        
    }
    
    func fillObject(){
        
        stores.append(storeModel(r_idStore: idStore, r_idCommercialArea: idCommercialArea, r_nameStore: nameStore, r_email: email, r_phoneNumber: phoneNumber))
       
        
        self.idStore=""
        self.nameStore=""
        self.email=""
        self.phoneNumber=""
        self.idCommercialArea=""
        
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
        
        return self.stores
    }
    
    
    
}