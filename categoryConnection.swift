//
//  categoryConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 7/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation


/*class categoryConnection: serverConnection {
    
    var idStore: String = ""
    var result: Bool = false
    var categories: [categoriaModel] = []
    
    
    func setr_userName( userName: String ){
        r_userName = userName
        
    }
    func getResponse(){
        
        let body = "<adm:getByIdCategoriaRequest><idTienda>EP000001</idTienda></adm:getByIdCategoriaRequest>"
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
    
    
    
}*/