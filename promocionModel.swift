//
//  promocionModel.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class promocionModel{
    var idPromocion: String
    var categoria: String
    var descripcion: String
    //var imagenPromo: NSimage
    
    init(r_idPromocion:String,r_categoria:String,r_descripcion:String ){
        idPromocion = r_idPromocion
        categoria = r_categoria
        descripcion = r_descripcion
    }
    func getIdPromocion() -> String{
        return self.idPromocion
    }
    func getCategoria() -> String{
        return self.categoria
    }
    func getDescripcion() -> String{
        return self.descripcion
    }
    
    func setIdPromocion(r_idPromocion: String){
        self.idPromocion = r_idPromocion
        
    }
    func setCategoria(r_categoria: String){
        self.categoria = r_categoria
        
    }
    func setDescripcion(r_descripcion: String){
        self.descripcion = r_descripcion
        
    }
    
}