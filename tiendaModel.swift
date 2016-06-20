//
//  tiendaModel.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class tiendaModel{
    var codigoTienda: String
    var nombreTienda: String
    
    init(r_codigoTienda: String, r_nombreTienda: String) {
        self.codigoTienda=r_codigoTienda
        self.nombreTienda=r_nombreTienda
    }
    
    func getCodigoTienda() -> String {
        return self.codigoTienda
    }
    func getNombretienda() -> String {
        return self.nombreTienda
    }
    func setCodigoTienda(r_codigoTienda: String){
        self.codigoTienda = r_codigoTienda
    }
    func setNombreTienda(r_nombreTienda: String){
        self.nombreTienda = r_nombreTienda
    }
    
    
    
}