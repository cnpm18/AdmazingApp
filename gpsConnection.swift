//
//  gpsConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 5/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class gpsConnection: serverConnection {
    var r_latitude: String = ""
    var r_longitude: String = ""
    var r_userName: String = ""
    var result: Bool = false
    var comercialArea: String = ""
    
    
    
    func setr_latitude( latitude: String ){
        r_latitude = latitude
        
    }
    func setr_longitde( longitude: String ){
        r_longitude = longitude
        
    }
    func setr_userName( userName: String ){
        r_userName = userName
        
    }
    func getResponse(){
        
        var body = "<adm:saveAccesoRequest><idUsuario>\(r_userName)</idUsuario><latitud>\(r_latitude)</latitud><longitud>\(r_longitude)</longitud></adm:saveAccesoRequest>"
        createConnection(body)
        
    }
    
    override func parser(parser: NSXMLParser, foundCharacters string: String) {
        if currentElementName == "resultado" {
            returnData(string)//from string to bool
            
        }
        if currentElementName == "nombreZonaComercial" {
            self.comercialArea = string
            
        }
        
        
    }
    
    func returnData(data:String){
        if data == "true"{
            self.result = true
        }
        else{
            
            self.result = false
        }
        
        
    }
    func getResult()->Bool{
        
        return self.result
    }
    
    
    
}