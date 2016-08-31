//
//  categoryConnection.swift
//  AdmazingApp
//
//  Created by Cristopher Nunez Del Prado on 7/07/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation


class couponsConnection: serverConnection {
    
    var r_idStore: String = ""
    var r_idCategory: String = ""
    var result: Bool = false
    var promotions: [promotionModel] = []
    var products: [productModel] = []
    
    
    
    var idPromotion: String = ""
    var idCategory: String = ""
    var idTypePromotion: String = ""
    var idStore: String = ""
    var promodescription: String = ""
    var startDate: String = ""
    var endDate: String = ""
    var imagePromotion: String = ""
    var idProduct: String = ""
    
    
    
    var name: String = ""
    var brand: String = ""
    var productdescription: String = ""
    var price: String = ""
    var origin: String = ""
    
    
    
    
    
    func setr_idStore( idStore: String ){
        r_idStore = idStore
        
    }
    
    func setr_idCategory( idCategory: String ){
        r_idCategory = idCategory
        
    }
    func getResponse(){
        
        let body = "<adm:getPromotionDetailedRequest><idStore>\(r_idStore)</idStore><idCategory>\(r_idCategory)</idCategory></adm:getPromotionDetailedRequest>"
        createConnection(body)
        
    }
    
    override func parser(parser: NSXMLParser, foundCharacters string: String) {
        
        
        switch currentElementName {
        case "idPromotion":
            self.idPromotion = self.idPromotion + string
            
            
        case "idCategory":
            self.idCategory = self.idCategory + string
            
        case "typePromotion":
            self.idTypePromotion = self.idTypePromotion + string
            
            
        case "idStore":
            self.idStore = self.idStore + string
            
        case "description":
            self.promodescription = self.promodescription + string
            
            
        case "startDate":
            self.startDate = self.startDate + string
            
        case "endDate":
            self.endDate = self.endDate + string
            
            
        case "imagePromotion":
            self.imagePromotion = self.imagePromotion + string
            
        case "idProduct":
            self.idProduct = self.idProduct + string
            
            
        case "name":
            self.name = self.name + string
            
            
        case "brand":
            self.brand = self.brand + string
            
        case "productdescription":
            self.productdescription = self.productdescription + string
            
            
        case "price":
            self.price = self.price + string
            
        case "origin":
            self.origin = self.origin + string
            fillObject()
            
            
        default: break
        }
        
        
        
    }
    
    func fillObject(){
        
        promotions.append(promotionModel(r_idPromotion: idPromotion, r_idCategory: idCategory, r_idTypePromotion: idTypePromotion, r_idStore: idStore, r_promodescription: promodescription, r_startDate: startDate, r_endDate: endDate, r_imagePromotion: imagePromotion, r_idProduct: idProduct))
        
        products.append(productModel(r_idProduct: idProduct, r_idCategory: idCategory, r_name: name, r_brand: brand, r_productDescription: productdescription, r_price: price, r_origin: origin))
        
         idPromotion = ""
         idCategory = ""
         idTypePromotion = ""
         idStore = ""
         promodescription = ""
         startDate = ""
         endDate = ""
         imagePromotion = ""
         idProduct = ""
        
         name = ""
         brand = ""
         productdescription = ""
         price = ""
         origin = ""

        
        
        
    }
    
    func returnData(data:String){
        if data == "true"{
            self.result = true
        }
        else{
            
            self.result = false
        }
        
        
    }
    func getResult()->[promotionModel]{
        
        return self.promotions
    }
    
    func getProducts()->[productModel]{
        
        return self.products
    }
    
    
    
}