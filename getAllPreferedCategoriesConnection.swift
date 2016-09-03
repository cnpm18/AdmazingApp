//
//  getAllPreferedCategoriesConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 3/09/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class getAllPreferedCategoriesConnection: serverConnection {
    
    
    var r_idUser = ""
    var result: Bool = false
    var categories: [categoryPreferenceModel] = []
    
    
    
    var idCategory: String = ""
    var nameCategory: String = ""
    var isPrefered: Bool = false
    
    
    func setr_idUser(idUser:String){
        r_idUser=idUser
    }
    func getResponse(){
        
        let body = "<adm:getAllPreferedCategoriesRequest><idUser>\(r_idUser)</idUser></adm:getAllPreferedCategoriesRequest>"
        createConnection(body)
        
    }
    
    override func parser(parser: NSXMLParser, foundCharacters string: String) {
        
        
        switch currentElementName {
        case "idCategory":
            self.idCategory = self.idCategory + string
            self.idCategory = removeWhitespace(self.idCategory)
            
            
        case "description":
            self.nameCategory = self.nameCategory + string
            
            
            
        case "isPrefered":
            if string == "true"{
                self.isPrefered = true
            }
            if string == "false"{
                self.isPrefered = false
            }
            fillObject()
            
        default: break
        }
        
        
        
    }
    
    func fillObject(){
        
        categories.append(categoryPreferenceModel(r_idCategory: idCategory, r_nameCategory: nameCategory, r_isSelected: isPrefered))
        
        self.idCategory = ""
        self.nameCategory = ""
        self.isPrefered = false
        
        
        
    }
    
    func returnData(data:String){
        if data == "true"{
            self.result = true
        }
        else{
            
            self.result = false
        }
        
        
    }
    func getResult()->[categoryPreferenceModel]{
        
        return self.categories
    }
    func removeWhitespace(string: String) -> String {
        var returnString: String
        returnString=string.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return returnString
    }
    
    
    
}