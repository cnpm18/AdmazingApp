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
    var idZonaComercial: String
    var razonSocial: String
    var email: String
    var telefono: String
    
    init(r_codigoTienda: String, idZonaComercial: String, r_nombreTienda: String, email:String, telefono: String) {
        self.codigoTienda=r_codigoTienda
        self.razonSocial=r_nombreTienda
        self.email=email
        self.telefono=telefono
        self.idZonaComercial=idZonaComercial
        
    }
    
    func getCodigoTienda() -> String {
        return self.codigoTienda
    }
    func getNombretienda() -> String {
        return self.razonSocial
    }
    func setCodigoTienda(r_codigoTienda: String){
        self.codigoTienda = r_codigoTienda
    }
    func setNombreTienda(r_nombreTienda: String){
        self.razonSocial = r_nombreTienda
    }
    
    
    
}