//
//  categoriaModel.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation
class categoriaModel{
    var idCategoria: String
    var nombreCategoria: String
    
    init(r_idCategoria: String, r_nombreCategoria:String) {
        self.idCategoria=r_idCategoria
        self.nombreCategoria=r_nombreCategoria
    }
    
    func getIdCategoria() -> String {
        return self.idCategoria
    }
    func getNombreCategoria() -> String {
        return self.nombreCategoria
    }
    func setIdCategoria(r_idCategoria: String){
        self.idCategoria = r_idCategoria
    }
    func setNombreCategoria(r_nombreCategoria: String){
        self.nombreCategoria = r_nombreCategoria
    }
    
    
    
}