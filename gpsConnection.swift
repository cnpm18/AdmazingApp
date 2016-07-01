//
//  gpsConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 28/06/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class gpsConnection: serverConnection {
    var r_userName: String = ""
    var r_password: String = ""
    var result: Bool = false
    
    
    
    func setr_userName( userName: String ){
        r_userName = userName
        
    }
    func setr_password( password: String ){
        r_password = password
        
    }
    func getResponse(){
        r_userName = substractOptional(r_userName)
        r_password = substractOptional(r_password)
        var body = "<adm:iniciarSesionRequest><idUsuario>\(r_userName)</idUsuario><password>\(r_password)</password></adm:iniciarSesionRequest>"
        createConnection(body)
    }
    
    override func parser(parser: NSXMLParser, foundCharacters string: String) {
        if currentElementName == "resultado" {
            print(string)
            returnData(string)
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