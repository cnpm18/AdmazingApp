//
//  categoryConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 7/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation


class categoryConnection: serverConnection {
    
    var r_idStore: String = ""
    var result: Bool = false
    var categories: [categoryModel] = []
    
    
    
    var idCategory: String = ""
    var nameCategory: String = ""
    
    
    func setr_idStore( idStore: String ){
        r_idStore = idStore
        
    }
    func getResponse(){
        
        let body = "<adm:getByIdCategoryRequest><idStore>\(r_idStore)</idStore></adm:getByIdCategoryRequest>"
        createConnection(body)
        
    }
    
    override func parser(parser: NSXMLParser, foundCharacters string: String) {
        
        
        switch currentElementName {
        case "idCategory":
            self.idCategory = self.idCategory + string
            self.idCategory = removeWhitespace(self.idCategory)
            
           
            
        case "description":
            self.nameCategory = self.nameCategory + string
           
            fillObject()
            
            
        default: break
        }
        
        
        
    }
    
    func fillObject(){
        categories.append(categoryModel(r_idCategory: idCategory,r_nameCategory: nameCategory))
        
        self.idCategory = ""
        self.nameCategory = ""
        
        
        
    }
    
    func returnData(data:String){
        if data == "true"{
            self.result = true
        }
        else{
            
            self.result = false
        }
        
        
    }
    func getResult()->[categoryModel]{
        
        return self.categories
    }
    func removeWhitespace(string: String) -> String {
        var returnString: String
        returnString=string.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return returnString
    }
    
    
    
}