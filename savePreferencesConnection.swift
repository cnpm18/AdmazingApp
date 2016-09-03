//
//  savePreferencesConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 2/09/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
/**/

import Foundation
class savePreferencesConnection: serverConnection {
    var r_userName: String = ""
    var r_idCategory: String = ""
    var result: Bool = false
    
    
    
    func setr_userName( userName: String ){
        r_userName = userName
        
    }
    func setr_idCategory( idCategory: String ){
        r_idCategory = idCategory
        
    }
    func getResponse(){
        r_userName = substractOptional(r_userName)
        r_idCategory = substractOptional(r_idCategory)
        var body = "<adm:savePreferenceRequest><idUser>\(r_userName)</idUser><idCategory>\(r_idCategory)</idCategory></adm:savePreferenceRequest>"
        createConnection(body)
        
    }
    
    override func parser(parser: NSXMLParser, foundCharacters string: String) {
        if currentElementName == "result" {
            returnData(string)//from string to bool
            
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