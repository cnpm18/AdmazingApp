//
//  zonaComercialModel.swift
//  Admazing
//
//  Created by Cristopher Nunez Del Prado on 16/05/16.
//  Copyright © 2016 Cristopher Nunez Del Prado. All rights reserved.
//

import Foundation

class zonaComercialModel{
    var idZonaComercial: String
    var nombreZonaComercial: String

    init(r_idZonaComercial:String,r_nombreZonaComercial:String ) {
        self.idZonaComercial=r_idZonaComercial
        self.nombreZonaComercial=r_nombreZonaComercial
    }
    
    func getIdZonaComercial() -> String {
        return self.idZonaComercial
    }
    func getNombreZonaComercial() -> String {
        return self.nombreZonaComercial
    }
    func setIdZonaComercial(r_idZonaComercial: String){
        self.idZonaComercial = r_idZonaComercial
    }
    func setNombreZonaComercial(r_nombreZonaComercial: String){
        self.nombreZonaComercial = r_nombreZonaComercial
    }

    
    
}