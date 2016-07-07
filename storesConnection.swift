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
    var stores: [tiendaModel] = []
    
    var codigoTienda: String = ""
    var razonSocial: String = ""
    var email: String = ""
    var telefono: String = ""
    var idZonaComercial: String = ""
    
    
    
    
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
                self.codigoTienda = self.codigoTienda + string
                print(codigoTienda)
                
            case "zonacomercial":
                self.idZonaComercial = self.idZonaComercial + string
                print(idZonaComercial)
                
            
            case "razonsocial":
                self.razonSocial = self.razonSocial + string
                print(razonSocial)
                
            case "email":
                self.email = self.email + string
                print(email)
                
            case "telefono":
                self.telefono = self.telefono + string
                fillObject()
                print(telefono)
                
            
            default: break
            }
        
        
        
    }
    
    func fillObject(){
        stores.append(tiendaModel(r_codigoTienda: self.codigoTienda,idZonaComercial: self.idZonaComercial,r_nombreTienda: self.razonSocial,email: self.email,telefono: self.telefono))
        
        self.codigoTienda=""
        self.razonSocial=""
        self.email=""
        self.telefono=""
        self.idZonaComercial=""
        
    }
    
    func returnData(data:String){
        if data == "true"{
            self.result = true
        }
        else{
            
            self.result = false
        }
        
        
    }
    func getResult()->[tiendaModel]{
        
        return self.stores
    }
    
    
    
}