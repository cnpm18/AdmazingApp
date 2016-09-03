//
//  getAllCategoriesConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 2/09/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class getAllCategoriesConnection: serverConnection {
    
    
    var result: Bool = false
    var categories: [categoryModel] = []
    
    
    
    var idCategory: String = ""
    var nameCategory: String = ""
    
    
    
    func getResponse(){
        
        let body = "<adm:getAllCategoriesRequest/>"
        createConnection(body)
        
    }
    
    override func parser(parser: NSXMLParser, foundCharacters string: String) {
        
        
        switch currentElementName {
        case "idCategory":
            self.idCategory = self.idCategory + string
            
            
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
    
    
    
}