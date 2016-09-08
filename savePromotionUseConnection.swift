//
//  savePromotionUseConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 8/09/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//



import Foundation
class savePromotionUseConnection: serverConnection {
    var r_idUser: String = ""
    var r_idPromotion: String = ""
    var result: Bool = false
    
    
    
    func setr_idUser( idUser: String ){
        r_idUser = idUser
        
    }
    func setr_idPromotion( idPromotion: String ){
        r_idPromotion = idPromotion
        
    }
    func getResponse(){
        r_idUser = substractOptional(r_idUser)
        r_idPromotion = substractOptional(r_idPromotion)
        var body = "<adm:savePromotionUseRequest><idUser>\(r_idUser)</idUser><idPromotion>\(r_idPromotion)</idPromotion></adm:savePromotionUseRequest>"
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